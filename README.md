# MagicViper
MagicViper is a automatic code generator for VIPER Architecture in iOS. 
It helps in setting up intial project files and creating viper modules in objective C only.

## Requirements
* Objective-C 

## Installation

Install gem with:

$ gem install MagicViper

## Usage

1. Create an Xcode project

2. Initialize basic VIPER structure with

```
MagicViper init
```

3. Input

* your project name
* preferred language
* author
# class prefix

(these will be used in generated files). You can change these settings in `.MagicViper.yml`

4. Create your module with

```
MagicViper module create Example
```

You can use saved configuration by just pressing enters.

#### v1.s
* initial version
* added class prefix option
* added basic appledoc comments for interfaces and protocols
* using new instead of alloc-init

