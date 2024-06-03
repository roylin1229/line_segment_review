# Line Segment Detection and Description Evaluation Code

**X. Lin, Y. Zhou, Y. Liu and C. Zhu, "[A Comprehensive Review of Image Line Segment Detection and Description: Taxonomies, Comparisons, and Challenges](https://ieeexplore.ieee.org/document/10530374)," in IEEE Transactions on Pattern Analysis and Machine Intelligence (T-PAMI), 2024.**

![](https://github.com/roylin1229/line_segment_review/blob/main/structure.jpg)  

## Getting Started

To run the example, follow these steps:

1. Install [mexopencv](https://kyamagu.github.io/mexopencv/) to obtain the "DescriptorMatcher" and "RotatedRect" function.  
2. Run the "eva_detection_w_demo.m" script to evaluate line segment detection algorithms with ground truth line segments.  
3. Run the "eva_detection_wo_demo.m" script to evaluate line segment detection algorithms without ground truth line segments.  
4. Run the "eva_description_demo.m" script to evaluate line segment description algorithms.  

## Evaluation Datasets
| **Dataset** | **# Groups/# Images** | **Evaluation type** | **Ground truth** | **Note** |
|-------------|-----------------------|---------------------|------------------|----------|
| [HPatches](https://github.com/hpatches/hpatches-dataset) | 116/696 | Detection and description | N/A | Natural images with variations in illumination and viewpoint. |
| [KADID-10k](https://database.mmsp-kn.de/kadid-10k-database.html) | 81/10,206 | Detection and description | N/A | Testing images with artificial distortions of blur, color distortion, compression, noise, brightness change, spatial distortion, and sharpness/contrast. |
| [RDNIM](https://cvg-data.inf.ethz.ch/RDNIM/RDNIM.zip) | 17/1,739 | Detection and description | N/A | Natural images with variations in light and homographic warp. |
| [DNIM](https://cvg-data.inf.ethz.ch/DNIM/DNIM.zip) | 17/1,722 | Detection and description | N/A | Natural images with variation in light. |
| [Apollo](https://developer.apollo.auto/synthetic.html) | 1,000/2,087 | Detection and description | N/A | Synthetic images with variation in light. |
| [VGGaffine](https://www.robots.ox.ac.uk/~vgg/research/affine/) | 8/48 | Detection and description | N/A | Natural images with variations in blur, viewpoint, zoom/rotation, light, and JPEG. |
| [Wireframe](https://github.com/huangkuns/wireframe) | 462/462 | Detection | Wireframe | Natural images in both indoor and outdoor scenarios. |
| [YorkUrban](https://www.dropbox.com/s/irpeiejekbgy383/YorkUrban-LineSegment.zip) | 102/102 | Detection | Line segment | Natural images in both indoor and outdoor scenarios. |


## Contact

If you have any questions or need further assistance, feel free to contact us at: roylin_cv@163.com

## Citation

@ARTICLE{10530374,  
  author={Lin, Xinyu and Zhou, Yingjie and Liu, Yipeng and Zhu, Ce},  
  journal={IEEE Transactions on Pattern Analysis and Machine Intelligence},   
  title={A Comprehensive Review of Image Line Segment Detection and Description: Taxonomies, Comparisons, and Challenges},   
  year={2024},  
  volume={},  
  number={},  
  pages={1-20},  
  doi={10.1109/TPAMI.2024.3400881}}  
