Meteor.publish 'annotations-by-publication', (publicationId) ->
  Annotations.find
    'publication.id': publicationId
  ,
    sort: [
      ['locationStart.pageNumber', 'asc']
    ]