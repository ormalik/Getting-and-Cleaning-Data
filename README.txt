The GCD.R script file contains code for all 5 steps of the analysis:

It is labelled by steps:

In the first step the x training and testing datasets are read and row bound to create a merged dataset. Similar exercise is carried out for the y dataset.
Then the subjects training and testing datasets are row bound. 

Then in Step 2 means and standard deviations are extracted from the features and x datasets. 

In Step 3 activity labels are read and attached to the y dataset.

In Step 4 the x, y, and subject datasets are column bound to create a complete dataset.

In Step 5 a separate tidy dataset is created which has column means for each subject and activity. This dataset is then written to a tidy data file.  

