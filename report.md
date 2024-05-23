# Report

<!-- Your text goes here. Remember to check the result of your CI to see whether 
the final PDF rendered correctly! -->

## Overview
The objective of this project is to create a dynamic light show on a micro:bit using ARMv7 assembly language. The program controls the micro:bit’s LEDs to display various patterns that change over time, demonstrating the capabilities of assembly programming and micro:bit hardware interfacing. The light show begins with a specified initial frame and continuously loops through different patterns, ensuring the display never stops. The program functions independently when powered via USB.


## Implementation 
I have implemented various pattern designs, animating them back and forth to enhance the dynamism of the light show. When designing the sequence of patterns, I aimed to create a flow reminiscent of the changing seasons(related to the theme nature)—spring to summer, summer to autumn, autumn to winter, and back to spring. This approach provides a cohesive and natural transition between patterns. Additionally, I implemented helper functions, such as 'high_bit', to set a specific bit high in a given register. LED control is managed through memory-mapped I/O registers, ensuring the appropriate pins are set high or low to display the intended patterns.


## Analysis
The design of the light show program exhibits several strengths. But to give one, I would say its scalability is a significant advantage. By using arrays to store LED patterns, the program can be easily expanded. New patterns can be incorporated by defining additional arrays and creating corresponding functions, allowing for effortless modifications and extensions. 
However, the design also has a weakness. The current design lacks comprehensive error handling. It assumes that all bit manipulations and memory accesses will be successful. To improve the robustness of the program, incorporating error handling mechanisms would be beneficial.

