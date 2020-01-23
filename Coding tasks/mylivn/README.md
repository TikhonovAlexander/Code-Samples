# Test assignment

### Summary

You need to implement an image loading library for user avatars. Implement as many of these requirements as you can be given the time you allow yourself to have. 

### Minimum requirements:
Your avatar loading class should provide an interface for load image by URL string. It should be supported by an optional placeholder, showing it during the loading process. The loading progress should be shown in the form of a colored border around the image.
You should also make a simple screen with a demonstration of this work. The demonstration should show an avatar image and button to load the next image from the network. It is not required to implement it like a separate framework/module.

### Optional requirements (you can choose any of them):
- Add image caching library: It should save loaded images on the phone’s hard drive and support 2 parameters: maximum number of objects in the cache and maximum disk storage space. The main purpose of this cache is to see how an applicant will design and implement the architecture of his own cache: it can be very simple but made by applicant himself.
- Support a 2-color gradient for the image’s progress bar. 
- After loading, an image should be cropped in a circle shape and resized to the size of the current image on the screen.

### Technical restrictions: 
No 3rd party libraries for performing these operations with images are allowed - you should do it by yourself. However, if you want to use some frameworks for dependency injection or reactive programming - it’s up to you.

### Visual example:
![Example](https://github.com/TikhonovAlexander/Code-Samples/blob/master/Coding%20tasks/mylivn/assets/cat.gif)

### Result
![Screen](https://github.com/TikhonovAlexander/Code-Samples/blob/master/Coding%20tasks/mylivn/assets/screen.png)
