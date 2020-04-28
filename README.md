# iTax-个税小帮手

个税小帮手（iTax）是一个集个税计算、对比、优化于一体的个税计算器。
组名：哇哦
组员：张秋菊、董嘉懿


## 目录结构描述

│  index.html    
│  itax.mpp     
│  iTax.sql     
│  README.md
|  ...
│              
├─comparison
│      final.html
│      salary.html
│      
├─compute
│      gaochou.html
│      gongzi.html
│      jingying.html
│      laowu.html
│      nianzhongjiang.html
│      qita.html
│      texu.html
│      
├─css
│      ...
│      
├─fonts
│      ...
│      
├─images
│     ...
│    
├─itax    
│  │                  
│  ├─src  
│  │  ├─bean
│  │  │      insurance.java
│  │  │      
│  │  ├─dao
│  │  │      InsDao.java
│  │  │      
│  │  └─servlet
│  │      ├─insurance
│  │      │      region.java
│  │      │      selectByRegion.java
│  │      │      
│  │      ├─optimizing
│  │      │      optimizingForHome.java
│  │      │      optimizingForSalary.java
│  │      │      
│  │      ├─other
│  │      │      author.java
│  │      │      labour.java
│  │      │      right.java
│  │      │      sum.java
│  │      │      
│  │      └─salary
│  │              taxForSalary.java
│  │              yeartax.java
│  │              
│  └─WebContent
│      │  index.jsp
│      │  
│      ├─comparison
│      │      final.jsp
│      │      salary.jsp
│      │      
│      ├─compute
│      │      gaochou.jsp
│      │      gongzi.jsp
│      │      jingying.jsp
│      │      laowu.jsp
│      │      nianzhongjiang.jsp
│      │      qita.jsp
│      │      texu.jsp
│      │      
│      ├─css
│      │      bootstrap.min.css
│      │      comparison.css
│      │      icofont.min.css
│      │      main.css
│      │      optimizing.css
│      │      slick.css
│      │      
│      ├─fonts
│      │      icofont.ttf
│      │      icofont.woff
│      │      
│      ├─images
│      │      ...
│      │      
│      ├─js
│      │      ...
│      │      
│      ├─layui
│      │  │  ...
│      │      
│      ├─optimizing
│      │      forhome.jsp
│      │      forsalary.jsp
│      │      
│      └─WEB-INF
│          └─lib
│                  
├─js
│     ...
│      
├─layui
│  │  ...
│              
└─optimizing
        forhome.html
        forsalary.html
        

// itax 文件夹中为最终完整内容呈现


## V1.0.0 版本内容更新
1. 个税计算     工资所得、年终奖、劳动报酬、稿酬、特许使用所得、经营所得其他所得个税计算
2. 个税对比     薪资对比、汇算对比
3. 个税优化     薪资优化、家庭优化
