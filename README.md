# Bio Containment Facility

Warning! You have entered a secure and highly dangerous area. This facility houses some of the most contagious and dangerous organisms on the planet. We have created this interface so that you can safely learn about the organisms and interact with their data. Below are the instructions for the installation and command usage of an interface to our facility.

## Download and install

1. Clone the repo to your machine using `$dev clone`
1. Run `$dev up` to install dependencies

## Command Line Interface

The entry point for the system is in the modelrailway folder - follow these instructions to test it out:

1. `cd` to `modelrailway`
1. run `$ exe/modelrailwaycli help` to see a list of commands and hints for using them
1. when using the command you can leave out the arguments on those commands with arguments to see the exceptions at work :)

## Available Commands

## `$ modelrailwaycli create_catalogue`

Creates and displays the catalogue

## `$ modelrailwaycli display_catalogue`

Displays the catalogue

## `$ modelrailwaycli calculate_total_cost`

Shows the total cost of the current catalogue

## `$ modelrailwaycli grab_type_quantity`

Print the total quantity of this type of class in the catalogue.
Usage: `modelrailwaycli grab_type_quantity classname` (e.g. 'SteamEngine')

## `$ modelrailwaycli grab_type_costs`

Prints the cost of each different instance of this class in the catalogue.
Usage: `modelrailwaycli grab_type_costs classname` (e.g. 'OilTruck')

## `$ modelrailwaycli find_type`

Prints out the instances of this type of class in the catalogue.
Usage: `modelrailwaycli find_type classname` (e.g. 'Station')

## `$ modelrailwaycli grab_expensive_items`

Selects and prints all items from the catalogue which are >= to the amount you enter.
Usage: `modelrailwaycli grab_expensive_items amount` (e.g. '50')
