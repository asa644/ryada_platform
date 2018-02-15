TODO LIST:
we have tags, services
tags are gonna be many to many
services are many to many
jsut like categories
oppening hours and closing hours
migrate the adding listing with the form
if you're the owner of the listing you can add lessons to that listing (form)
add reviews and responds to every listing and lesson
add images to every lesson and listing

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
<%= render 'form', listing: @listing %>





notes:
IAS
access_level








Improtant resources:
https://github.com/ankane/blazer (for intelligent business apps)







functional testnig for the premature phase
jira, slack, coll


TODO:
style for the datetime using brower



Pilates, Dance, Boxing, Gym Time, Running, Yoga, Strength training, Martial arts, Rowing, Outdoors, Sports




