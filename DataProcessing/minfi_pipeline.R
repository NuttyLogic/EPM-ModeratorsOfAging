

args <- commandArgs(trailingOnly = TRUE)

exp_id = args[1]
exp_ref_dir = args[2]
idat_dir = args[3]
output_dir = args[4]

print(exp_id)
print(exp_ref_dir)
print(idat_dir)
print(output_dir)

library("FlowSorted.Blood.450k")
library("FlowSorted.Blood.EPIC")
library('IlluminaHumanMethylation450kmanifest')
library('IlluminaHumanMethylationEPICmanifest')
library('minfi')

ref_file = paste(exp_ref_dir, exp_id, ".txt", sep='')

idat_files = as.matrix(read.table(ref_file, header=FALSE, sep='', dec='.'))
idat_files = paste(idat_dir, idat_files, sep='')

rgset = read.metharray(idat_files, verbose=TRUE, force=TRUE)
rgset.ssNoob = preprocessNoob(rgset, dyeMethod="single")
grset = mapToGenome(rgset.ssNoob)

# calculate beta matrix 
b_matrix = getBeta(rgset.ssNoob)

# returns dataframe, median Meth / median unmeth / predicted sex
sex_QC = minfiQC(rgset.ssNoob, fixOutliers=TRUE)

# returns dataframe
cell_counts = estimateCellCounts(rgset, processMethod="preprocessNoob")


gz1 <- gzfile(paste(output_dir, exp_id, '_methmatrix.gz', sep=''), "w")
write.csv(b_matrix, gz1)
close(gz1)

gz2 <- gzfile(paste(output_dir, exp_id, '_qc.gz', sep=''), "w")
write.csv(sex_QC$qc, gz2)
close(gz2)

gz3 <- gzfile(paste(output_dir, exp_id, '_cell_counts.gz', sep=''), "w")
write.csv(cell_counts, gz3)
close(gz3)
