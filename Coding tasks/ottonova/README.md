# Ottonova

![Wireframe](https://github.com/TikhonovAlexander/Code-Samples/blob/master/Coding%20tasks/ottonova/Wireframe.png)

You are asked to write a small application. It shouldn’t take you longer than an afternoon to build (3-5 hours). This will allow us to get a better understanding of your general coding skills, as well as your approach to problem-solving.
Please try to showcase your knowledge of patterns, architecture and clean code, while building a simple and pragmatic solution.

This assignment is meant to simulate a task that you would have on a daily basis here at ottonova. It is designed to give you flexibility on the approach and tools, so please take advantage of this to showcase your range of knowledge as a mobile software engineer.

## Requirements
Build a simplified version of our timeline screen (see wireframe below) for the first profile delivered from the profiles endpoint (also below). The timeline contains the following two components:

Health Prompts:
This is what we call our in-app service cards. You will retrieve the health-prompts from the API and take the first health prompt. Normally, this component would be a collection of cards that you would scroll through but for now you’re only required to display the information in a simple view. Tapping the health prompt triggers no action for this example.
Timeline:
This is a list of events that are chronologically ordered based on the client’s actions. You will request the timeline events, and display them in a scrollable list. When pressing on one of the events, navigate to a detail view where you show a simple label with the title of the event.

## Task
* Please complete the coding challenge in Java, Kotlin or Swift
* It should not take you longer than 3-5 hours
* Please send us the finished project in a zip/tar file

## Resources

### Base URL: https://freemium.ottonova.de/api
### Endpoints:
- /user/customer/profiles
- /user/customer/profiles/{profile_id}/timeline-events
- /user/customer/profiles/{profile_id}/health-prompts

