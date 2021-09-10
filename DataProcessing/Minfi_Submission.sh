#!/bin/bash
#$ -pe shared 4
#$ -l h_rt=12:00:00
#$ -l h_data=8G
#$ -m a


while getopts f:d:o:i: option
do
 case "${option}"
 in
 f) files_to_process=${OPTARG};;
 d) ref_directory=${OPTARG};;
 o) output_folder=${OPTARG};;
 i) idat_dir=${OPTARG};;

 esac
done

mkdir -p $output_folder

cd ${output_folder}

. /u/local/Modules/default/init/modules.sh
module load python/3.7.2
module load R/4.0.2

sample=$(cat $files_to_process | head -${SGE_TASK_ID} | tail -1 )

echo Rscript /EPMTraitAssociation/minfi_pipeline.R $sample $ref_directory $idat_dir $output_folder

Rscript /EPMTraitAssociation/minfi_pipeline.R $sample $ref_directory $idat_dir $output_folder
