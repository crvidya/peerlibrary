@Annotations = new Meteor.Collection 'Annotations', transform: (doc) => new @Annotation doc

class @Annotation extends @Document
  # created: timestamp of this version
  # author:
  #   username: author's username
  #   displayName: author's display name
  #   id: author's id
  # body: annotation's body
  # publication:
  #   id: publication's id
  # locationStart
  #   pageNumber: one-based
  #   index: start index of text layer elements of the annotation's highlight (inclusive)
  #   left: left coordinate of start of annotation's highlight
  #   top: top coordinate of start of annotation's highlight
  # locationEnd
  #   pageNumber: one-based
  #   index: end index of text layer elements of the annotation's highlight (inclusive)
  #   left: left coordinate of end of annotation's highlight
  #   top: top coordinate of end of annotation's highlight
