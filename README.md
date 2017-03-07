# looker for Topcoder

Available at https://topcoder.looker.com

## Models

 The main model is topcoder_model_main.  That defines the views for the majority of the platform data. Additional models are setup for specific uses, mainly to provide limited data sets to specific groups of users.

## Data

 All data availble to looker is in Redshift.  Currently, that is the only data source configured with looker.  The data is a combination of platform data (challenges, members, etc), salesforce (time, billable hours, subscriptions).
