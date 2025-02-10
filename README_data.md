# Data Files

This folder contains the raw RNA-Seq gene expression count data used for the differential expression analysis of lymphoma subtypes: **ABC (Activated B-cell-like)** and **GCB (Germinal Center B-cell-like)**. These files represent the **direct output from the sequencing pipeline**, meaning they contain **unnormalized read counts**.  

## Files Overview  

### **1. GCB_project_data1.xlsx**  
This file contains the **raw gene expression counts** for GCB-subtype lymphoma samples.  

- **Column A:** `Symbol` - Gene identifiers (gene symbols).  
- **Columns B to N:** (`High-1` to `Low-40`) - Expression counts for individual samples.  
  - "High" and "Low" likely correspond to different conditions or classifications within the GCB subtype.  
- **Values:** Whole numbers representing the number of reads mapped to each gene in each sample.  
- **Notes:** This dataset requires normalization before any downstream statistical analysis.  

### **2. ABC_project_data2.xlsx**  
This file contains the **raw gene expression counts** for ABC-subtype lymphoma samples.  

- **Column A:** `Symbol` - Gene identifiers (gene symbols).  
- **Column B:** `Description` - Additional annotations (mostly "NA" in this dataset).  
- **Columns C to AN:** (`High-1` to `Low-20`) - Expression counts for individual samples.  
  - "High" and "Low" classifications correspond to different sample groups.  
- **Values:** Whole numbers representing RNA sequencing read counts per gene.  
- **Notes:** This file also contains **unnormalized raw counts**, which must be processed using tools like DESeq2 or edgeR before differential expression analysis.  

## How to Use These Files  

### **1. Reproducibility**  
To replicate the analysis, download both Excel files along with the rest of the repository. The R scripts (such as `DESeq all files.R`) are designed to read these files as input. Ensure you have the necessary R packages installed (`readxl` for reading Excel files).  

### **2. Data Preprocessing & Normalization**  
Before performing differential expression analysis, the following steps are required:  

1. **Import the raw count data** using `readxl` in R.  
2. **Merge the expression counts** with sample metadata if needed.  
3. **Normalize the data** using DESeq2 or edgeR to account for sequencing depth and sample variation.  
4. **Perform differential expression analysis** to compare ABC and GCB subtypes.  

For full details, refer to the main project README.  

### **3. File Structure**  
- `GCB_project_data1.xlsx`: Rows represent individual genes; columns represent sample-wise read counts.  
- `ABC_project_data2.xlsx`: Similar structure, with additional description columns.  

Both datasets follow the **raw count matrix format**, commonly used in RNA-Seq analysis.  

## Additional Notes  

- **Versioning:** Any updates or modifications to these files are tracked in the repository’s commit history.  
- **Data Confidentiality:** Ensure that no sensitive or proprietary information is present before making the repository public. If the data is confidential, consider providing only processed or anonymized versions.  

## Contact  

For questions about the data files or for further information, please contact the repository owner at your preferred public email (e.g., your GitHub no-reply email).  
