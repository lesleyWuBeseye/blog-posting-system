# A Blog Posting System
## User Account
* It should be able to create a user account, with `username` and `email` attributes.
* Both `username` and `email` should be unique among all users and cannot be blank.
* `username` cannot be modified once created and should be at least 8 characters long.
* `email` should be in `/\A[\w.]+@example.com\Z/i` format and can be modified.
* When creating a `user`, both `username` and `email` should be provided.
* When updating a `user`, only `email` can be modified.
* When deleting a `user`, all his/her `board`s and `post`s will also be deleted.


## Board
* The `name` of a `board` should be unique among all existing `board`s and cannot be blank.
* A `user` may have one or more `board`s as the owner.
* A `board` may have one or more `post`s.
* When creating a `board`, both `username` and `name` should be provided.
* When updating a `board`, only `name` can be modified.
* When deleting a `board`, all its `post`s will also be deleted.


## Post
* A `post` has its author, which is a `user`, `content`, `created_at`, and `updated_at`.
* A `post` must belong to a `board`.
* A `post` may have one or more replies which are also `post`s.
* A reply, which is a `post`, can also have its own replies.
* A `post` without `source_post` is an **article**, i.e. the start of the thread.
* A `post` with `source_post` is a **reply**.
* When creating a `post`, `author`, `board`, and `content` should be provided.
* When updating a `post`, only `content` can be modified.
* When deleting a `post`, all its replies will also be deleted.


## Spec
* In outer-most page, there is a link/button that shows all `user`s.
* In outer-most page, there is a link/button that shows all `board`s.
* In `user` list page, there is a link/button that can create a `user`.
* Given a `user`, there is a link/button that can modify his/her attributes.
* Given a `user`, there is a link/button that can delete the `user` himself/herself.
* Given a `user`, there is a link/button that shows all `board`s belong to him/her.
* Given a `user`, there is a link/button that shows all articles posted by himself/herself.
* Given a `user`, there is a link/button that shows all replies posted by himself/herself.
* In `board` list page, there is a link/button that can create a `board`.
* Given a `board`, there is a link/button that can modify its attributes.
* Given a `board`, there is a link/button that can delete the `board` itself.
* Given a `board`, there is a link/button that shows all articles belong to it.
* Given a `board`, there is a link/button that can create an article.
* Given a `post`, there is a link/button that can modify its attributes.
* Given a `post`, there is a link/button that can delete the `post` itself.
* Given a `post`, there is a link/button that can create a reply.