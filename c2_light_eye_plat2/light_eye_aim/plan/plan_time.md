<!--
##################################################################################
## Company: fpgaPublish
## Engineer: f
## 
## Create Date: 2022/07/24 12:52:03
## Design Name: plan_time
## Module Name: 
## Project Name: 
## Target Devices: 
## Tool Versions: 
## Description: 
## 
## Dependencies: 
##  
## Revision: 
## Revision 0.01 - File Created 
## Additional Comments:
## 
##################################################################################
-->
<span id="0"></span>
## light_eye_design_plat2
### 2022/07/24 12:48:17
- [ ] PL实现
    * 实现BRAM的数据灰度处理并转发ARM
- [ ] PS实现
    * 实现UDP图像接收转存DDR
    * 实现BRAM数据收发
- [ ] PC实现
    * 实现UDP图像收发
    * 实现图像转存到file
    * 实现图像在控件显示
```mermaid              
gantt                   
dateFormat  YYYY-MM-DD  
title 周开发计划        
section 设计            
功能定义                  :des1, 2022/07/24 12:48:17,1d
PL设计                    :des2, after des1, 2d       
PS设计                    :des3, after des2, 2d       
PC设计                    :des4, after des3, 2d       
section 开发                                          
PL实现                    :crit, done, after des1, 2d 
PS实现                    :crit, done, after des2, 2d 
PC实现                    :crit, done, after des3, 2d 
发布                      :crit, done, after des4, 2d 
section 总结                                          
功能总结                  :done, a1, after des4, 1d   
文档总结                  :after a1, 1d               
总结完成                  :1d                         
```