# MagicViper
MagicViper is a automatic code generator for VIPER Architecture in iOS. 
It helps in setting up intial project files and creating viper modules in objective C only.
Understand what Viper architecture is : https://medium.com/trendyol-tech/creating-an-ios-viper-module-step-by-step-guide-cd1f414b7dd3

## Requirements
* Objective-C 
* ruby 

## Installation

Install gem with:

$ gem install MagicViper


## Usage

1. Create an Xcode project
2. Initialize basic VIPER structure with
```
MagicViper init
```
3. Input Required

* your project name
* preferred language
* author
* class prefix
(these will be used in generated files). This input setting is stored in '.MagicViper.yml' file. 
You can change these settings in `.MagicViper.yml`

4. Create your module with
```
MagicViper module create Example
```
You can use saved configuration by just pressing enters.
