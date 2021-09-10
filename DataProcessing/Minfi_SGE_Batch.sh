files_to_process=/EPMTraitAssociation/ref_sheets.txt
# get the number of lines in txt file
number_files=$(cat $files_to_process | wc -l)

# set variables to pass to alignemnt script
ref_dir=/EPMTraitAssociation/ProcessExpsRefs/
output_folder=/EPMTraitAssociation/processed_data/
idat_dir=/EPMTraitAssociation/idat_files/


# of jobs to process simultaneously
JOBS=45


# submit jobs

qsub -M colinpatfarrell@g.ucla.edu -m a -t 1-$number_files -tc $JOBS Minfi_Submission.sh -f $files_to_process -d $ref_dir -o $output_folder -i $idat_dir
