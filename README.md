# Line Segment Detection and Description Evaluation Framework

**X. Lin, Y. Zhou, Y. Liu, and C. Zhu**, *"A Comprehensive Review of Image Line Segment Detection and Description: Taxonomies, Comparisons, and Challenges"*, in **IEEE Transactions on Pattern Analysis and Machine Intelligence (T-PAMI)**, 2024.  
[![Paper Link](https://img.shields.io/badge/Paper-IEEE%20T--PAMI-blue)](https://ieeexplore.ieee.org/document/10530374)  
[![Project Page](https://img.shields.io/badge/Project-Page-green)](https://roylin1229.github.io/LSD_Review/)

![](https://github.com/roylin1229/line_segment_review/blob/main/structure.jpg)

## Overview

This repository provides the official implementation and evaluation framework for the research paper *"A Comprehensive Review of Image Line Segment Detection and Description: Taxonomies, Comparisons, and Challenges"*. The framework includes tools for evaluating line segment detection and description algorithms on various datasets. Additionally, it serves as a comprehensive resource for researchers and practitioners in the field of computer vision.

### Key Features
- **Evaluation of Line Segment Detection Algorithms**: Supports evaluation with and without ground truth line segments.
- **Evaluation of Line Segment Description Algorithms**: Provides a standardized framework for assessing description algorithms.
- **Comprehensive Datasets**: Includes multiple datasets for diverse evaluation scenarios.

## Getting Started

To run the evaluation framework, follow these steps:

1. **Install Dependencies**: Install [mexopencv](https://kyamagu.github.io/mexopencv/) to obtain the necessary functions, such as `DescriptorMatcher` and `RotatedRect`.
2. **Run Evaluation Scripts**:
   - `eva_detection_w_demo.m`: Evaluate line segment detection algorithms with ground truth line segments.
   - `eva_detection_wo_demo.m`: Evaluate line segment detection algorithms without ground truth line segments.
   - `eva_description_demo.m`: Evaluate line segment description algorithms.

## Evaluation Datasets

The framework supports evaluation on the following datasets:

| **Dataset**       | **# Groups/# Images** | **Evaluation Type** | **Ground Truth** | **Note**                                                                 |
|--------------------|-----------------------|---------------------|------------------|-------------------------------------------------------------------------|
| [HPatches](https://github.com/hpatches/hpatches-dataset) | 116/696              | Detection & Description | N/A            | Natural images with variations in illumination and viewpoint.           |
| [KADID-10k](https://database.mmsp-kn.de/kadid-10k-database.html) | 81/10,206            | Detection & Description | N/A            | Images with artificial distortions (blur, color, compression, noise, etc.). |
| [RDNIM](https://cvg-data.inf.ethz.ch/RDNIM/RDNIM.zip) | 17/1,739             | Detection & Description | N/A            | Natural images with variations in light and homographic warp.           |
| [DNIM](https://cvg-data.inf.ethz.ch/DNIM/DNIM.zip) | 17/1,722             | Detection & Description | N/A            | Natural images with variations in light.                                |
| [Apollo](https://developer.apollo.auto/synthetic.html) | 1,000/2,087          | Detection & Description | N/A            | Synthetic images with variations in light.                              |
| [VGGaffine](https://www.robots.ox.ac.uk/~vgg/research/affine/) | 8/48                 | Detection & Description | N/A            | Natural images with variations in blur, viewpoint, zoom/rotation, etc.  |
| [Wireframe](https://github.com/huangkuns/wireframe) | 462/462              | Detection            | Wireframe       | Natural images in indoor and outdoor scenarios.                         |
| [YorkUrban](https://www.dropbox.com/s/irpeiejekbgy383/YorkUrban-LineSegment.zip) | 102/102              | Detection            | Line segment    | Natural images in indoor and outdoor scenarios.                         |

## Additional Resources

- **Project Homepage**: Visit the [project homepage](https://roylin1229.github.io/LSD_Review/) for detailed information, additional resources, and updates.
- **Comprehensive Collection of Line Segment Detection Algorithms**: Explore a curated collection of algorithms [here](https://roylin1229.github.io/LSD_Review/).
- **Comprehensive Collection of Line Segment Description Algorithms**: Discover a detailed collection of algorithms [here](https://roylin1229.github.io/LSD_Review/).

## Contact

For questions, feedback, or further assistance, please contact us at: **roylin_cv@163.com**.

## Citation

If you use this framework in your research, please cite the following paper:

```bibtex
@ARTICLE{10530374,
  author={Lin, Xinyu and Zhou, Yingjie and Liu, Yipeng and Zhu, Ce},
  journal={IEEE Transactions on Pattern Analysis and Machine Intelligence},
  title={A Comprehensive Review of Image Line Segment Detection and Description: Taxonomies, Comparisons, and Challenges},
  year={2024},
  volume={},
  number={},
  pages={1-20},
  doi={10.1109/TPAMI.2024.3400881}
}
