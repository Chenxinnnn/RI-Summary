# RI-and-Elephant-Random-Walks

This is Chenxin's junior year independent study project. Following her interest in random walks (RW), she contacted Prof. Maximilian Nitzschner at Courant Institute of Mathematics to learn about a mathematics model called Random Interlacements (RI).   

Throughout the project, she studied the construction and key properties of RI from a theoretical perspective, which involved knowledge from stochastic process, for example concepts like Martingales, Poisson Point Processes, etc. Then, in order to confirm these properties, including 
a crucial phase change of the local picture of the empty set of RI on a large torus within the first uNd steps in three dimensions as the parameter u varies, she learned about RI simulation methods and chose to implement an algorithm to construction RI by single simple random walk trajectory. Other approaches include constructing RI as a random interlacement point process, which follows the logics of poisson point processes, thus requires one to construct multiple simple random walks and she is still trying to deal with its computational complexity.

Finally, she moved on to particularly investigate a variant model of simple random walks involving some reinforcement due to a certain memory of the process, quantified by a memory parameter p between 0 and 1, namely Elephant Random Walk (ERW). By visulazing the model with a series of random variables, she explored the behavior of the cover times of the torus for both the SRW and ERW at varying p, leading to new conjectures for the cover time for the ERW.

In this repository, you can find her source code for these two models in different dimensions. Also, the summary paper is available here titled "gcx_2022fall_RW&RI".

<img width="400" alt="EWR on 2d size 100 p=0 85" src="https://user-images.githubusercontent.com/98552734/222078788-a28863e5-83a3-4acb-b0c2-ed9ca0c2a645.png">

Here's an image of ERWs on two dimensions, in which one can clearly see that the walk travels in one direction at a higher probability.
