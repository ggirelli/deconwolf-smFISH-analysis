# deconwolf-smFISH-analysis

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
4) Dots intensity threshold selection
    - Generating overlays of selected dots
5) Shift correction between datasets
    - Check overlap and percentage of selected dots
6) Dots-per-nucleus distribution
