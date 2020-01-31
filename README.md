# Bio Containment Facility

Warning! You have entered a secure and highly dangerous area. This facility houses some of the most contagious and dangerous organisms on the planet. We have created this interface so that you can safely learn about the organisms and interact with their data. Below are the instructions for the installation and command usage of an interface to our facility.

## Download and install

1. Clone the repo to your machine using `$dev clone`
1. Run `$dev up` to install dependencies

## Command Line Interface

To open the command interface:

1. run `$ exe/biocontainmentfacility help` to see a list of commands and hints for using them
1. when using the command you can leave out the arguments on those commands with arguments to see the exceptions at work :)

## Available Commands

## `$ biocontainmentfacility display_summary_all`

Displays summarized information on all organisms in the catalogue

## `$ biocontainmentfacility display_details_all`

Displays detailed information on all organisms in the catalogue

## `$ biocontainmentfacility display_summary`

Displays summarized information on the chosen organism.

Usage: `biocontainmentfacility display_summary number` (e.g. 3)

## `$ biocontainmentfacility display_detail`

Displays detailed information on the chosen organism.

Usage: `biocontainmentfacility display_detail number` (e.g. 5)

## `$ biocontainmentfacility display_bacteria`

Displays summarized information on all bacteria in the catalogue

## `$ biocontainmentfacility display_viruses`

Displays summarized information on all viruses in the catalogue

## `$ biocontainmentfacility display_lethal_organisms`

Displays all organisms with greater than or equal to the chosen lethality.

Usage: `biocontainmentfacility display_lethal_organisms number` (e.g. 9)

## `$ biocontainmentfacility display_cost_of_treatment`

Displays the cost of treating all the organisms in the catalogue, for the given number of cases.

Usage: `biocontainmentfacility display_cost_of_treatment number` (e.g. 500)

## `$ biocontainmentfacility display_resistant_organisms`

Displays summarized information on organisms which are resistant to the chosen treatment.

Usage: `biocontainmentfacility display_resistant_organisms number` (e.g. 8)

## `$ biocontainmentfacility display_susceptible_organisms`

Displays summarized information on organisms which are susceptible to the chosen treatment.

Usage: `biocontainmentfacility display_susceptible_organisms number` (e.g. 7)

## `$ biocontainmentfacility diagnose_symptoms`

Displays summarized information on organisms which may cause the chosen symptoms. You may choose 1 or more symptoms from the list ro narrow your search.

Usage: `biocontainmentfacility diagnose_symptoms number [..number number]` (e.g. 19 2)
