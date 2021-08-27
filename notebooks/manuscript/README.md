## Ki67 tissue smFISH

Having addressed the crowding problem, we moved on to test whether Deconwolf could improve the throughput of microscopy approaches, such as FISH, by testing its performance on images acquired with low magnification objectives. Currently, most assays, such as MERFISH, ORCA (https://doi.org/10.1038/s41586-019-1035-4) or DNA-PAINT (doi.org/10.1371/journal.pgen.1007872), require high-throughput and thus rely on 100x or 60x objectives. We therefore wondered whether Deconwolf could help overcome this limit by rendering low magnification images compatible with such techniques. For this purpose we turned to a material which would especially benefit from an improved high throughput imaging – tissue microarray. We performed smFISH for the Ki67 transcript and imaged the same fields of view either using an oil 60x or an air 20x objective.

At 60x magnification the images after deconvolution looked sharper than in the original raw images. However, even without deconvolution the RNA FISH dots were clearly visible and easy to pick (**Figure 3a, b**). At the 20x magnification the quality of the images deteriorated dramatically in the case of raw images (**Figure 3c**). However, when we run deconvolution on them we could identify most of the dots as those present in 60x images (**Figure 3d**).

Given that the staining was performed on a tissue section, it was not possible to detect the FISH dots automatically in DOTTER following the typical analysis path. Therefore we attempted to identify a different unbiased way of true dot identification by analyzing various parameters of the dots.

When we plotted the signal to noise ratio against the DoG-filtered intensity of each dot from the 60x, we could observed two clear clouds of points, corresponding to true dots, with relatively high SNR and intensity, and *noisy* dots, with low intensity and low to intermediate SNR (**Figure 3e, Supplementary Fig. X1a**). At 60x, we found that the two clouds were sufficiently separated to allow us to manually identify a threshold value for the DoG-filtered intensity (**Figure 3f, Supplementary Fig. X1b**)

Indeed, when plotting the FWHM distribution of the dots belonging to the two clouds we could see that the distributions were always significantly different (p-value < 10e-12, Wilcoxon test, **Supplementary Fig. X1c,h**).

While, at 60x magnification, we could observe these two clouds of dots in both DW and raw images, at 20x magnification they were apparent only in DW images (**Supplementary Fig. X1d-e**).

When we compared true dots picked in raw and DW images at 60x, there was a great overlap between them (**Figure 3g**). We used the dots shared between 60x raw and DW as the reference for the comparison with the 20x images.

We then attempted the same unbiased identification of true dots in the 20x raw images. However, the scatterplot of SNR to DoG-fitered intensity revealed one large cloud of dots making it impossible to distinguish true dots from noise in the same way we did for the 60x images (**Supplementary Fig. X1d-e**)

When we tried the same approach on DW 20x images, the two clouds of points could be seen again  (**Supplementary Fig. X1-f-g**).

We then intersected the true dots identified in the DW 20x images with the reference dots and found a great overlap between them (**Figure 3h*).

These results proves that not only DW makes it possible to detect highly contrasted RNA FISH dots in images acquired using a low magnification air objective, but that even an unbiased detection of such dots is possible from such images.

Most importantly, the use of such a low magnification objective does not seem to greatly impact dot sensitivity, given that we detected 77.23% of 60x dots also in 20x DW images (**Figure 3h**).

## Figure

- **Figure 3**: a-d on the same row: FISH image.
    + [x] Panel a: inset of 60x raw with DAPI in blue, FISH dots in magenta, nuclear contour in yellow.
    + [x] Panel b: inset of 60x DW with DAPI in blue, FISH dots in magenta, nuclear contour in yellow.
    + [x] Panel c: inset of 20x raw with DAPI in blue, FISH dots in magenta, nuclear contour in yellow.
    + [x] Panel d: inset of 20x DW with DAPI in blue, FISH dots in magenta, nuclear contour in yellow.
    + [x] Panel e: scatterplot of DoG-filtered intensity (Y) vs SNR (X), for 60x DW field #1.
    + [x] Panel f: logged density distribution for threshold identification, in 60x DW field #1.
    + [x] Panel g: barplot with dot overlap between 60x raw and DW.
    + [x] Panel h: barplot with dot overlap between 20x and 60x-based reference.

- **Supplementary X1**: a-d on the same row: SNR vs DoG-filtered intensity.
    + [x] Panel a: scatterplot of DoG-filtered intensity (Y) vs SNR (X), for 60x raw field #1.
    + [x] Panel b: logged density distribution for threshold identification, in 60x raw field #1.
    + [x] Panel c: FWHM distribution of dots un/filtered by field-based threshold for 60x DW and raw, field #1.
    + [x] Panel d: scatterplot of DoG-filtered intensity (Y) vs SNR (X), for 20x raw field #1.
    + [x] Panel e: logged density distribution for threshold identification, in 20x raw field #1.
    + [x] Panel f: scatterplot of DoG-filtered intensity (Y) vs SNR (X), for 20x DW field #1.
    + [x] Panel g: logged density distribution for threshold identification, in 20x DW field #1.
    + [x] Panel h: FWHM distribution of dots un/filtered by field-based threshold for 20x DW and raw, field #1.
