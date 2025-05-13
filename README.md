# Health-Services-Clustering

Health services aim to maintain, improve, and restore health while preventing disease for individuals and communities. They are generally divided into private and government-run services. Besides these, traditional health practices also exist in many regions. According to the WHO, factors like income, education, environment, and access affect people’s choice of healthcare. In Indonesia, uneven development means healthcare is concentrated in cities, leading to varied treatment choices across provinces. This has led to the need for grouping of choices of places for medical treatment by the community in each province in Indonesia.The popular and effective statistic method that can be used to grouping is K-Means Clustering.

# Data Sampling
The data used in this study is secondary data obtained from the Badan Pusat Statistik page, related to data on the selection of places for medical treatment by residents in 34 provinces in Indonesia in November 2021. The places for medical treatment attached to the data are Rumah Sakit Pemerintah, Rumah Sakit Swasta, Klinik, Puskesmas, UPKM (Upaya Kesehatan Bersumberdaya Masyarakat), Praktek Tradisional, and Lainnya. The data can be obtain [here](https://view.officeapps.live.com/op/view.aspx?src=https%3A%2F%2Fraw.githubusercontent.com%2Fdhafinabdillah%2FHealth-Services-Clustering%2Frefs%2Fheads%2Fmain%2FData%2520PKL.xlsx&wdOrigin=BROWSELINK)

# Pre Processing and Modelling
I did identify outlier and pre process the data in ways that will help your model train more effectively. The goal of identifying outlier is to clip the value and preprocessing is to transform features to be on a similar scale. After that, model with K-Means. All the process is done within this [code](https://github.com/dhafinabdillah/Health-Services-Clustering/blob/main/Clustering%20PKL.R)

# Results
| Cluster | Avg_RS_Pemerintah | Avg_RS_Swasta | Avg_Klinik | Avg_Puskesmas | Avg_UKBM | Avg_Praktek_Tradisional | Avg_Lainnya | Count |
|---------|-------------------|---------------|------------|----------------|----------|--------------------------|-------------|-------|
| 1       | 10.623552         | 86.45156      | 36.83416   | 47.89686       | 8.502914 | 5.607257                 | 3.151404    | **9**  |
| 2       | 15.111641         | 57.84356      | 80.85166   | 35.30271       | 2.781718 | 2.665332                 | 1.385437    | **12** |
| 3       | 4.252899          | 43.27166      | 44.67371   | 85.05248       | 8.545875 | 2.153209                 | 2.120239    | **13** |

Interpretation
- Cluster 1: High number of private hospitals and moderate public facilities. Possibly urban or semi-urban areas with mixed access.
- Cluster 2: High number of clinics but fewer community health centers (Puskesmas) and UKBM. May indicate private-dominated healthcare access.
- Cluster 3: Highest Puskesmas average, suggesting strong public health presence. Likely rural or government-focused regions.

Cluster Plot

![cluster](https://github.com/user-attachments/assets/ef900f91-f060-48d5-8ab9-64344a15726c)

# Date
December 2021 - January 2022
