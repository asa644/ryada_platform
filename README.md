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
