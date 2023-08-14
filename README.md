# RBF
Radial Basis Function (RBF) Algorithm in MATLAB

This repository contains the code and files for implementing a Radial Basis Function (RBF) algorithm in MATLAB.
The RBF algorithm is a versatile technique used for pattern recognition, function approximation, and more. 
In this implementation, we'll explore the fundamentals of RBF networks and demonstrate how to apply them to a simple example

# RBF Network Architecture

The RBF algorithm consists of three main steps: centers initialization, activation function computation, and weight adjustment. In our implementation:

    Centers Initialization: We use k-means clustering to determine the center locations. Adjust the num_centers parameter to control the number of centers.

    Activation Function Computation: We use Gaussian radial basis functions to compute the activations for each center. Modify the spread parameter to adjust the width of the Gaussian functions.

    Weight Adjustment: Weights are adjusted using the Moore-Penrose pseudo-inverse of the activation matrix. The weights are used to approximate the output.
    
# Conclusion

This implementation provides a basic introduction to the Radial Basis Function (RBF) algorithm in MATLAB. By running the provided script and experimenting with different parameters and datasets, you can gain insights into how RBF networks can be applied for function approximation tasks.

For more advanced applications and detailed explanations, consider exploring specialized RBF libraries and resources. Happy coding and enjoy exploring the power of RBF networks!
