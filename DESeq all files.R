#installing packages
install.packages("readxl")
install.packages("dplyr")
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}
BiocManager::install("DESeq2")

library(readxl)
library(dplyr)
library(DESeq2)

#read excel files
data1 <- read_excel("C:/Users/hp/Downloads/Top%2015%25%20ABC.xlsx")
data2 <- read_excel("C:/Users/hp/Downloads/GCB%20top%2015%20%25.xlsx")

#read count data
head(data1)

# Convert the High and Low columns to numeric (assuming all High/Low columns have similar naming structure)
data1 <- data1 %>%
  mutate(across(starts_with("High"), as.numeric)) %>%
  mutate(across(starts_with("Low"), as.numeric))

data2 <- data2 %>%
  mutate(across(starts_with("High"), as.numeric)) %>%
  mutate(across(starts_with("Low"), as.numeric))

count_matrix1 <- data1 %>% select(-Symbol, -Description) %>% as.matrix()
count_matrix2 <- data2 %>% select(-Symbol, -Description) %>% as.matrix()

# Ensure rownames are the symbols from each dataset
rownames(count_matrix1) <- data1$Symbol
rownames(count_matrix2) <- data2$Symbol

# For data1 (20 High, 20 Low)
metadata1 <- data.frame(
  impact = rep(c("High", "Low"), each = 20))
  row.names(metadata1) = colnames(count_matrix1)
)

# For data2 (40 High, 40 Low)
metadata2 <- data.frame(
  impact = rep(c("High", "Low"), each = 40))
  row.names(metadata2) = colnames(count_matrix2)
)


# Ensure matching dimensions between count matrix and metadata
all(colnames(count_matrix1) == rownames(metadata1))  # Should return TRUE
all(colnames(count_matrix2) == rownames(metadata2))  # Should return TRUE

# Rename any duplicate column names if necessary
colnames(count_matrix1) <- make.unique(colnames(count_matrix1))
colnames(count_matrix2) <- make.unique(colnames(count_matrix2))


# For data1
dds1 <- DESeqDataSetFromMatrix(countData = count_matrix1, colData = metadata1, design = ~ condition)

# For data2
dds2 <- DESeqDataSetFromMatrix(countData = count_matrix2, colData = metadata2, design = ~ condition)

dds1
dds2

# pre-filtering: removing rows with low gene counts
# keeping rows that have at least 10 reads total
keep1 <- rowSums(counts(dds1)) >= 10
dds1 <- dds1[keep1,]

keep2 <- rowSums(counts(dds2)) >= 10
dds2 <- dds2[keep2,]

dds1
dds2

# set the factor level
#dds1$condition <- relevel(dds1$condition, ref = "untreated")

#running DESeq2 analysis
dds1 <- DESeq(dds1)
dds2 <- DESeq(dds2)

# Results
res1 <- results(dds1)
res2 <- results(dds2)

res1
res2

#Extract significntly DEGs
sig_genes1 <- res1[which(res1$padj < 0.05), ]
sig_genes2 <- res2[which(res2$padj < 0.05), ]

#saving results
write.csv(sig_genes1, "significant_genes_data1.csv")
write.csv(sig_genes2, "significant_genes_data2.csv")

# Plot results
plotMA(res1, main = "MA Plot for Data1", ylim = c(-2, 2))
plotMA(res2, main = "MA Plot for Data2", ylim = c(-2, 2))


