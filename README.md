TODO LIST:
we have tags, services
tags are gonna be many to many
services are many to many
jsut like categories
oppening hours and closing hours




commands for building
rails g scaffold listings name:string description:string status:integer owner:references user:references city:string street:string landmark:string phonenumber:string longtitude:float latitude:float

rails g model Service name:string
rails g model ServiceListing service:references listing:references
rails g model Tag name:string
rails g model TagListing tag:references listing:references
rails g model Category name:string
rails g model CategoryListing Category:references listing:references



rails g scaffold lessons name:string description:string   city:string street:string landmark:string phonenumber:string longtitude:float latitude:float user:references listing:references





TODO for later:

Heatmap.js

validation, what did we do in sprints,
rails g model Respond content:text user:references review:references

starting a branch
