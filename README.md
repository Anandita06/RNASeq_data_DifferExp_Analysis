# RNASeq Differential Expression Analysis for Lymphoma Subtypes

## Overview
This repository contains R scripts and related resources for performing differential expression analysis on RNA-Seq data from lymphoma samples. The primary aim is to compare two major subtypes of Diffuse Large B-Cell Lymphoma (DLBCL):

- ABC (Activated B-cell)
- GCB (Germinal Center B-cell)

By using DESeq analysis, the project identifies genes that are significantly differentially expressed between these subtypes, which can help in understanding molecular differences and potential therapeutic targets.

## Project Structure
- **DESeq all files.R**  
  The main R script that performs the differential expression analysis.
- **DESeq analysis.Rproj**  
  RStudio project file to conveniently open the project in RStudio.
- **significant_genes_data1.csv** and **significant_genes_data2.csv**  
  CSV files containing the lists of significantly differentially expressed genes.
- **Rplot data1.png** and **Rplot data2.png**  
  Plots generated during the analysis (e.g., volcano plots, heatmaps).
- **.gitignore**  
  Specifies files and directories to be ignored by Git.

## Requirements
- **R** (version 3.6 or later recommended)
- **RStudio** (optional but recommended for ease of use)
- **DESeq2** package (or DESeq, depending on your script)  
  You may need to install additional R packages. Check the script for dependencies.

## Getting Started
Follow these steps to set up and run the analysis:

1. **Clone the repository:**  
   ```bash
   git clone https://github.com/Anandita06/RNASeq_data_DifferExp_Analysis.git
2. **Open the project:**  
   Open DESeq analysis.Rproj in RStudio.
3. **Install required packages:** In R or RStudio, run:
    ```r
   install.packages("BiocManager")
   BiocManager::install("DESeq2") #Install any additional packages as needed

4. **Run the analysis:**  
   Open the DESeq all files.R script in RStudio and execute it. The script will perform the differential expression analysis.
5. **Review the outputs:**  
   Check the generated CSV files (significant_genes_data1.csv and significant_genes_data2.csv) for the lists of significant genes.
   View the plots (Rplot data1.png and Rplot data2.png) for visual insights into the data.

## Data Description
The dataset used in this analysis comprises RNA-Seq expression profiles from lymphoma samples, which are classified into two groups:

ABC (Activated B-cell)
GCB (Germinal Center B-cell)
This classification is crucial for understanding the biological differences between the two subtypes and for discovering subtype-specific biomarkers.

## Results
1. Significant Genes:
The analysis identifies and outputs genes that are significantly differentially expressed between the ABC and GCB subtypes.
2. Visualizations:
The accompanying plots help visualize the overall expression patterns and highlight key differences between the two groups.

## Contributing
Contributions are welcome! If you have suggestions, improvements, or additional analyses, please feel free to open an issue or submit a pull request.

## Contact
For questions or feedback, please contact [].
