# Tools to Help with International Co-operation of Clinical Trials

At the moment each country/institution is performing clinical trials independently, sharing the results at the end of the trials. This is a relatively slow and inefficient process. 

Results are reinforced by serially replicating the trials elsewhere. 

Clinical trials can be particularly difficult in Covid-19 cases since most patient recover spontaneously regardless of cure. The chance of false positives is high, particularly for antivirals that could help in earlier stages. This requires larger tests that can be more easily achieved via co-ordination.

In addition several different treatments have to be tested in parallel, if each one is performed vs a control set, this creates futher inefficiencies. 

A blockchain stack could improve co-operation at international level and across institutions thus speeding up aggregation of results and improving reliability and security.

A user friendly UI can also help overburdened personnel do the data entry faster and with fewer errors.

# Related News

* [WHO announces they want to co-ordinate trials on Covid-19](https://www.who.int/dg/speeches/detail/who-director-general-s-opening-remarks-at-the-media-briefing-on-covid-19---18-march-2020).

# Proof of Concept

## Editor Application
* API + Website + Mobile App
* Authentication/Authorization for write access, possibly per site
* As a consideration inputing should be as fast as possible, with as little typing as possible, work well on mobile/tablet/desktop. Ideally Android/iOS/browser.

### Form for testing institution details
* Institution Name
* Address
* Person(s) Responsible

### Form for patient characteristics
* SiteSpecific Patient-ID (anonymous)
* Sex
* DoB
* Etnicity
* Pre-existing conditions
* Pre-existing medications
* Allergies
* CovidSymptoms StartDate
* Hospitzlization Date

### Form for daily evolution 
* DateTime / Temperature
* DateTime / Oxygen level
* DateTime / BP
* DateTime / ?
* Covid19 Tests: DateTime / test-type / result
* Covid19 Staging: DateTime / Staging
* Covid19 Symptoms: DateTiem / Symptom
* Non-Covid19 Symptoms: DateTime / Symptom
* MedicalTreatement: DateTime / Treatment / dose
* Non-MedicalTreatement: DateTime / Treatment (EG oxygen/ventilation/...)

## Data Browser and Analytics
* API + Website

### Access to detailed patient records.
* Filter on patient characteristics
* Records are anonymized  
* Web-based visualization of records + download

### Cube Browser
* Summary stats and charts given filters for various characteristics / desired measures/scores.
* Typical cube-browser style.
   
### Analytics to Identify Optimal Therapy

#### Scoring
* Scoring components:
  * Fatality rate
  * Rate of non-fatal severe complications
  * Delay in moving to worse pathology stages
  * Delay in moving to better pathology stages
  * Full recovery time
  * Penalisation for side effects (needs some weights for non-covid19 symptoms)
* Weighting of above to compute overall score TBC
* The above scores should be computed for buckets of "similar" patient characteristics/staging as well as for the overall score. Definition of similarity TBC.

#### Pairwise Therapy Stats:
* Traditional pairwise statistical test results (student's T & co): null hypothesis = therapy A > therapy B.
* Stats for Therapy A/B/Diff. 
* Stats for overal score with socre subcomponents
* Stats for each population bucket and aggregate.
* Stats: mean, median, stdev, max, min, t-student (for diff) ...

#### Groupwise Comparison
Comparison of n therapies/controls-set with n>2
Use appropriate (matrix/heatmap?) visualization TBC

#### Overall Analysis
Random forest / gradient boosting Vs therapy / patient characteristics / pathology staging
Visualization of results

#### Patient-Specific Optimal Therapy
Like above but limited to "similar" patients given filter on characteristics/staging for the selected subset of therapies.

## Authorizations (preliminary)

### Write Side

* Main responsible person per each site can assign editors/readers and edit site form
* Editors can fill patient forms

### Read Side

* All editors can access all records of their own site
* WHO can permission each site to see each other data
* WHO can permission other institutions to access data

## Patient Consent Workflow

Even though it is likely that patient data is anonymized, it is possible that workflows could be needed to manage and store consent. Possibly at site level.

See https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5676196.5/

# Logical Architecture
(this section is a stub)

![image](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Clinical_Trial_blockchain_logical_Architecture.png/800px-Clinical_Trial_blockchain_logical_Architecture.png)

## Institution / Site
It is the hospital, Cro, organisation in general, conducting the Clinical Trial
## WHO Competent Authority
it is the reference organisation on WHO side, gathering information from all the local Institutions / Sites
## Users
### Ctrial Adm
it's the personnel in charge of setting up the Clinical Trial, in conformance to the essential Ctrial Documents 
### Ctrial Ops
It's the presonnel in charge of updating Ctrial info, possibly on daily basis. info includes Patient data, and disease daily evolution parameters
## Web App
it's the standard web application allowing users to creat and edit Ctrial information
the web app shall allow the user to interact seamlessly with the blockchain, thanks to the back end integration with the institution / site associated Wallet.

## Blockchain
### Blockchain Type
It's suggested, for the initial PoC phase, to set up a Proo-of-authority Blockchain (4 validator nodes), based on CosmosSDK/Tendermint frameworks

### Wallet
it's a standard Cosmos HD Wallet, including the account management developed by Commercio network project,based on Decentralised Identifier and COM DID Method

### Supported Transactions
An initial set of supported transactions includes:
#### SetTrial
create a record for the Ctrial, identified with the Institution / Site DID as Controller, and its DID as subject.
the record includes all the referrals to the Ctrial sections, namely:
- Investigator's brochure
- Clinical Study protocol
- Protocol Amendment (optional)
- Informed Consents (optional)
- Study Progress Report (optional)
- Case Report Form (optional)
All the referred documents are identified via DID fragment (for instance: <Ctrial DID>#iBrochure) and the respective Decentralised Storage URI.

#### UpdateTrial
Update an existing CTrial record.
Can update any of the CTrial sections

#### Sharetrial
Share Trial with other subjects (DID), sharing the cryptographic material to access data or other access rights.

### Decentralised Storage
permanetly stores each version/snapshot of all the data submitted for a Ctrial record.
URIs are referred in Ctrial record, at each completed section

### CTrial Schema
TBC

# Resources

* [Improving data transparency in clinical trials using blockchain smart contracts](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5357027.1/).
* [Blockchain protocols in clinical trials: Transparency and traceability of consent](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5676196.5/).
* [On the Design of a Blockchain Platform for Clinical Trial and Precision Medicine](https://ieeexplore.ieee.org/abstract/document/7980138).
* [https://trialsjournal.biomedcentral.com/articles/10.1186/s13063-017-2035-z](https://trialsjournal.biomedcentral.com/articles/10.1186/s13063-017-2035-z).
* [Clinical Trial Protocol](https://clinicaltrials.gov/ProvidedDocs/85/NCT01619085/Prot_000.pdf).
