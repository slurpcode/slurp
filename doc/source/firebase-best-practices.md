# 🔥 Firebase Best Practices

Firebase is the name of a mobile platform from Google that makes it easy to build a back-end that is both scalable and efficient. In other words, it is a platform that allows the rapid development of mobile and web applications.

Firebase itself, however, is more than just a database. It's a complete product with API interfaces, an integrated auth platform, and associated cloud functions to leverage micro-service, back-end construction for things that need to be hidden on a server, such as payment processing.

## What is Firebase Cloud Firestore?

The Firebase Cloud Firestore is a NoSQL database provided by Google Firebase. It provides real-time syncing between the cloud database and the client app, it stores data in hierarchical data structures which are documents organized into collections. 

## Firestore Best Practices

### Add Rules

When you create your Firebase Firestore Database it's by default open to the internet on test mode, make sure to add the required Firestore Rules to secure your data and your app.

### Denormalize Data

When you need deep nesting functionality, consider adding a couple of different collections, even when you need to add some data duplication and use more than one request to retrieve what you need.

### Document IDs

Avoid the document IDs like " . ", "...", and "/", also do not use monotonically increasing document IDs such as:
"Customer1, Customer2, Customer3, ...".
Do use auto-generated IDs.

### Field Names

Avoid the following characters in field names because they require extra escaping: "", "[, ]", "*", "`"

## What is Firebase Authentication?

With Firebase Authentication, building secure authentication systems is a snap. This tool also gives your end users a better onboarding and signing-in experience.

## Authentication best practices

### Combine Firestore with Auth

As your app will grow and you will have to handle an important number of users it is required to add a new collection to Firestore "Users" to save your user's data.

### Verify Your Users

To make sure your app is secured, and not vulnerable, you must implement email verification to users signed up with email/password.

### Keep Users Data Safe

When we use Firestore to store our app users' data make sure to never save your user's passwords! Also saving their e-mails is a bad practice.

## What is Firebase Storage?

Firebase Storage allows you to share or store content produced by your users such as images, videos, or even audio files. It is a powerful object storage solution that stands out for its simplicity and cost-efficiency.
Storage Best Practices

### Add Rules

Just like securing Firestore Database with rules, we can secure Storage with rules, they are here for a reason, so do add them!

### Limit Bandwidth Usage

If your users have the access to share and deploy pictures or videos in your app, make sure to compress and resize the files before or after they get uploaded, or you risk paying dearly.
