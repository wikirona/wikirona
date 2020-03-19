# Using Blockchain to Help with International Co-operation of Clinical Trials

At the moment each country/institution is performing clinical trials independently, sharing the results at the end of the trials. This is a relatively slow and inefficient process. 

Results are reinforced by serially replicating the trials elsewhere. 

Clinical trials can be particularly difficult in Covid-19 cases since most patient recover spontaneously regardless of cure. The chance of false positives is high, particularly for antivirals that could help in earlier stages. This requires larger tests that can be more easily achieved via co-ordination.

In addition several different medicaments have to be tested in parallel, if each one is performed vs a control set, this creates futher inefficiencies. 

A blockchain stack could improve co-operation at international level and across institutions thus speeding up aggregation of results and improving reliability.

# Implementation


## Input forms (prelimminary)

As a consideration inputing should be as fast as possible, with as little typing as possible, work well on mobile/tablet/desktop. Ideally android/ios/browser.

### Form for testing institution details
* Institution Name
* Address
* Person(s) Responsible

### Form for patient characteristics
* SiteSpecific Patient-ID (anonymous)
* Sex
* DoB
* Etnicity
* Pre-existing conditions [checks]
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
* Covid19 Imaging: DateTime / Lung Imaging Staging
* Non-Covid19 Symptoms: DateTime / Symptom
* MedicalTreatement: DateTime / Treatment / dose
* Non-MedicalTreatement: DateTime / Treatment

## Editor Application
* API + Web + Mobile App
* Authentication/Authorization for write access, possibly per site
* Entry forms

## Data Browser and Analytics
* API + Web
* Authentication/Authorization for read access, possibly per site
* Filter functionality:
	* Extract all individual datasets
	* Aggregation functionality:
		* Aggregate across relevant metrics

## Authorization (preliminary)

### Write Side

* Main responsible person per each site can assign editors/readers and edit site form
* Editors can fill patient forms

## Read Side

* All editors can access all records of their own site
* WHO can permission each site to see each other data
* WHO can permission other institutions to access data


# Related News

* [WHO announces they want to co-ordinate trials on Covid-19](https://www.who.int/dg/speeches/detail/who-director-general-s-opening-remarks-at-the-media-briefing-on-covid-19---18-march-2020).

# Resources

* [Improving data transparency in clinical trials using blockchain smart contracts](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5357027.1/).
* [Blockchain protocols in clinical trials: Transparency and traceability of consent](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5676196.5/).
* [On the Design of a Blockchain Platform for Clinical Trial and Precision Medicine](https://ieeexplore.ieee.org/abstract/document/7980138).
* [https://trialsjournal.biomedcentral.com/articles/10.1186/s13063-017-2035-z](https://trialsjournal.biomedcentral.com/articles/10.1186/s13063-017-2035-z).
* [Clinical Trial Protocol](https://clinicaltrials.gov/ProvidedDocs/85/NCT01619085/Prot_000.pdf).