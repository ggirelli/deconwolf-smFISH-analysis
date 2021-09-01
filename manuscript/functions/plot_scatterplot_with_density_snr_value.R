require(cowplot)
require(data.table)
require(ggforce)
require(ggplot2)
require(ggpubr)

plot_scatterplot_with_density_snr_value = function(
    dots_data, nuclear_features, selected_magnification, selected_image_type,
    current_field_id, threshold,
    snr_exp_breaks, value_limits=NULL
) {
    ddata = dots_data[FWHM >= .5 & FWHM <= 5 & nid > 0]
    setkeyv(ddata, c("series_id", "nid"))
    ddata = nuclear_features[ddata][!is.na(size)][
        selected_magnification == magnification][
        selected_image_type == image_type]

    ddata[, dot_type := "noisy"]
    ddata[threshold <= Value2, dot_type := "good"]

    p1 = ggplot(ddata[current_field_id == sid], aes(x=SNR2, y=Value2)) +
        geom_point(aes(color=dot_type), size=.5, alpha=.5) +
        geom_hline(yintercept=threshold, color="#336600", linetype="dashed") +
        scale_color_brewer(sprintf("[%03d] %s %s. Dot type",
                                   current_field_id, selected_magnification, selected_image_type
                                  ), palette="Set1") +
        scale_x_log10("SNR",
                      breaks=10**snr_exp_breaks,
                      labels=as.expression(lapply(
                          snr_exp_breaks, function(x) {
                              bquote(10^.(x)) }))) +
        theme_bw() +
        theme(
            legend.position="top",
            axis.text.y=element_blank(),
            axis.title.y=element_blank(),
            axis.ticks.y=element_blank(),
            panel.spacing=unit(0, "pt"),
            plot.margin=unit(c(0, 0, 0, 0), "pt")
        ) + guides(color=guide_legend(title.position="top"))

    p2 = ggplot(ddata[current_field_id == sid], aes(x=Value2)) +
        geom_density() +
        geom_vline(xintercept=threshold, color="#336600", linetype="dashed") +
        scale_y_continuous(trans=trans_reverser('log10')) +
        theme_bw() + coord_flip() +
        theme(
            axis.text.x=element_text(angle=45, hjust=1),
            panel.spacing=unit(0, "pt"),
            plot.margin=unit(c(0, 0, 0, 0), "pt")
        )
    
    if ( !is.null(value_limits) ) {
        p1 = p1 + scale_y_log10("", limits=value_limits)
        p2 = p2 + scale_x_log10("DoG-filtered intensity (a.u.)", limits=value_limits)
        density_range = range(ggplot_build(p2)$data[[1]]$density, na.rm=T)
    } else {
        p1 = p1 + scale_y_log10("")
        p2 = p2 + scale_x_log10("DoG-filtered intensity (a.u.)")
        density_range = range(density(ddata[current_field_id == sid, Value2])$y, na.rm=T)
    }
    p2 = p2 + scale_y_continuous(trans=trans_reverser('log10'), limits=c(density_range[2], max(1e-4, density_range[1])))

    options(repr.plot.width=8, repr.plot.height=8)
    p = plot_grid(p2, p1, nrow=1, rel_widths=c(.5, 1), align="hv", axis="tbr", greedy=F)
    return(p)
}