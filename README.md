# Report
## Overview
The objective of this project is to create a dynamic light show on a micro:bit using ARMv7 assembly language. The program controls the micro:bit’s LEDs to display various patterns that change over time, demonstrating the capabilities of assembly programming and micro:bit hardware interfacing. The light show begins with a specified initial frame and continuously loops through different patterns, ensuring the display never stops. The program functions independently when powered via USB.

## Implementation
I have implemented various pattern designs, animating them back and forth to enhance the dynamism of the light show. When designing the sequence of patterns, I aimed to create a flow reminiscent of the changing seasons(related to the theme nature)—spring to summer, summer to autumn, autumn to winter, and back to spring. This approach provides a cohesive and natural transition between patterns. The use of memory in this project is also notable since it is centered around arrays to store the bit patterns for each LED display frame. This approach allows for easy modification and expansion of the light show patterns. By storing patterns in memory, the process of updating the LED states is simplified, as the predefined patterns can be easily loaded and executed. Arrays were also chosen as part of my design of the code over static variables to provide greater flexibility and scalability in managing multiple patterns. This choice enables efficient storage and retrieval of patterns, which is crucial for ensuring smooth transitions between different frames. I thought by using arrays I can allow the program to handle numerous patterns neatly, facilitating the creation of a dynamic and engaging light show. The ability to store and access multiple patterns efficiently contributes to the overall performance and responsiveness of the program, making the light show visually appealing and technically robust. Additionally, I implemented helper functions, such as 'high_bit', to set a specific bit high in a given register. LED control is managed through memory-mapped I/O registers, ensuring the appropriate pins are set high or low to display the intended patterns, which will enhance the user experiencing with the micro bit.

## Analysis
The design of the light show program exhibits several strengths. Firstly, its scalability is a significant advantage. By using arrays to store LED patterns, the program can be easily expanded. New patterns can be incorporated by defining additional arrays and creating corresponding functions, allowing for effortless modifications and extensions. Secondly, the modular design greatly enhances code readability and maintainability. Each function responsible for a pattern operates independently, which simplifies updates and debugging. This modular approach ensures that changes in one part of the code do not affect others, promoting a clean and organized codebase. Lastly, the performance of the program is optimized through direct bit manipulation, providing efficient control over the LEDs. This results in smooth and responsive transitions between light show patterns, creating an appealing visual display.

However, the design also has some weaknesses. The complexity of using low-level ARMv7 assembly language can pose a challenge, particularly for those who are not familiar with assembly programming. While the modular design helps manage this complexity by breaking the code into smaller, more manageable sections, the overall understanding of the program may still be difficult for some. Additionally, the current design lacks comprehensive error handling. It assumes that all bit manipulations and memory accesses will be successful. To improve the robustness of the program, incorporating error handling mechanisms would be beneficial. This would ensure the program can handle unexpected scenarios gracefully, enhancing its reliability.
