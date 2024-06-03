# Line Segment Detection and Description Evaluation

**X. Lin, Y. Zhou, Y. Liu and C. Zhu, "A Comprehensive Review of Image Line Segment Detection and Description: Taxonomies, Comparisons, and Challenges," in IEEE Transactions on Pattern Analysis and Machine Intelligence (T-PAMI), 2024.**

## Getting Started

To run the example, follow these steps:

1. Install [mexopencv](https://kyamagu.github.io/mexopencv/) to obtain the "DescriptorMatcher" and "RotatedRect" function.  
2. Run the "eva_detection_w_demo.m" script to evaluate line segment detection algorithms with ground truth line segments.  
3. Run the "eva_detection_wo_demo.m" script to evaluate line segment detection algorithms without ground truth line segments.  
4. Run the "eva_description_demo.m" script to evaluate line segment description algorithms.  

## Evaluation Datasets
| **Dataset** | **# Groups/# Images** | **Evaluation type** | **Ground truth** | **Note** |
|-------------|-----------------------|---------------------|------------------|----------|
| HPatches | 116/696 | Detection and description | N/A | Natural images with variations in illumination and viewpoint. |
| KADID-10k | 81/10,206 | Detection and description | N/A | Testing images with artificial distortions of blur, color distortion, compression, noise, brightness change, spatial distortion, and sharpness/contrast. |
| RDNIM | 17/1,739 | Detection and description | N/A | Natural images with variations in light and homographic warp. |
| DNIM | 17/1,722 | Detection and description | N/A | Natural images with variation in light. |
| Apollo | 1,000/2,087 | Detection and description | N/A | Synthetic images with variation in light. |
| VGGaffine | 8/48 | Detection and description | N/A | Natural images with variations in blur, viewpoint, zoom/rotation, light, and JPEG. |
| Wireframe | 462/462 | Detection | Wireframe | Natural images in both indoor and outdoor scenarios. |
| YorkUrban | 102/102 | Detection | Line segment | Natural images in both indoor and outdoor scenarios. |


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
