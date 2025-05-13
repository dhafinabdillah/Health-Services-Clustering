# Data management
library(readxl)
Data_PKL <- read_excel("D:/Dhafin's/Kuliah/S7/Laporan PKL/Data PKL.xlsx")
summary(Data_PKL)

# EDA
par(mfrow = c(3, 3))

boxplot(Data_PKL$`RS Pemerintah`, main = "RS Pemerintah")
boxplot(Data_PKL$`RS Swasta`, main = "RS Swasta")
boxplot(Data_PKL$Klinik, main = "Klinik")
boxplot(Data_PKL$Puskesmas, main = "Puskesmas")
boxplot(Data_PKL$UKBM, main = "UKBM")
boxplot(Data_PKL$`Praktek Tradisional`, main = "Praktek Tradisional")
boxplot(Data_PKL$Lainnya, main = "Lainnya")

clip_iqr <- function(x) {
  Q1 <- quantile(x, 0.25)
  Q3 <- quantile(x, 0.75)
  IQR_val <- Q3 - Q1
  lower <- Q1 - 1.5 * IQR_val
  upper <- Q3 + 1.5 * IQR_val
  x_clipped <- ifelse(x < lower, lower,
                      ifelse(x > upper, upper, x))
  return(x_clipped)
}

library(dplyr)
Data_PKL <- Data_PKL %>%
  mutate(
    `RS Pemerintah` = clip_iqr(`RS Pemerintah`),
    UKBM = clip_iqr(UKBM),
    Lainnya = clip_iqr(Lainnya)
  )

# Pre processing
par(mfrow = c(3, 3))

hist(Data_PKL$`RS Pemerintah`, main = "RS Pemerintah")
hist(Data_PKL$`RS Swasta`, main = "RS Swasta")
hist(Data_PKL$Klinik, main = "Klinik")
hist(Data_PKL$Puskesmas, main = "Puskesmas")
hist(Data_PKL$UKBM, main = "UKBM")
hist(Data_PKL$`Praktek Tradisional`, main = "Praktek Tradisional")
hist(Data_PKL$Lainnya, main = "Lainnya")

Data_PKL_scaled <- Data_PKL[2:8] %>%
  mutate(
    `RS Pemerintah` = log(`RS Pemerintah`),
    Puskesmas = log(Puskesmas),
    UKBM = log(UKBM),
    Lainnya = log(Lainnya)
  ) %>%
  select(`RS Pemerintah`, `RS Swasta`, Klinik, Puskesmas, UKBM, `Praktek Tradisional`, Lainnya) %>%
  scale()

# Learning
library(factoextra)
fviz_nbclust(Data_PKL_scaled, kmeans, method = "wss")

set.seed(123)
clustering <- kmeans(Data_PKL_scaled, centers = 3, nstart = 25)

# Result
Data_PKL$Cluster <- as.factor(clustering$cluster)

Data_PKL %>%
  group_by(Cluster) %>%
  summarise(
    Avg_RS_Pemerintah = mean(`RS Pemerintah`),
    Avg_RS_Swasta = mean(`RS Swasta`),
    Avg_Klinik = mean(Klinik),
    Avg_Puskesmas = mean(Puskesmas),
    Avg_UKBM = mean(UKBM),
    Avg_Praktek_Tradisional = mean(`Praktek Tradisional`),
    Avg_Lainnya = mean(Lainnya),
    Count = n()
  )

fviz_cluster(clustering, data = Data_PKL_scaled)