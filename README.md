# deconwolf-smFISH-analysis

Tissue smFISH at different magnifications, either processed with `deconwolf` or not.

## Details

- Voxel size (ZYX)
    + 60x: 300x108.3x108.3 nm
    + 20x: 300x325x325 nm
- Fluorophore emission lambda: 665 nm

## Datasets

- 60x: deconwolfed and raw
- 20x: deconwolfed and raw

The images from 20x were previously registered on the 60x ones.

Similarly, undilated masks were also initially provided for both magnifications.

## Analysis steps

1) Mask dilation with no overlap
2) Nuclear feature analysis and filtering
3) DOTTER analysis and dots export
    - Using `DoG` approach, `center_of_mass` refinement.
    - Extract `all dots`, 1 M dots, calculating SNR, nSNR, and FWHM.
    - Corrected SNR (i.e., `SNR2` column) added by EW.
    - Re-scale dots intensity (i.e., `Value` column) based on deconwolf `scaling` factor.
    - Filter by FWHM and nuclei selection
4) Reference dots selection 
    - Based on dots intensity threshold
    - Generated overlays of selected dots
5) Comparing different magnifications
    - Shift correction between datasets
    - Check overlap and percentage of selected dots
6) Dots-per-nucleus distribution
