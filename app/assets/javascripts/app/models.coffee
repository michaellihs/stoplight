class Project extends Backbone.Model

class ProjectCollection extends Backbone.Collection
  model: Project
  url: '/projects.json'

Projects = new ProjectCollection
Projects.comparator = (p)->
  p.get('name')

@Projects = Projects
