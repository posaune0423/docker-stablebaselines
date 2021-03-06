# docker-stablebaselines

## Description:
A Docker environment for reinforcement learning in Python 3 including the OpenAI Gym toolkit	

Includes: 

**1. Basics:** [NumPy](http://www.numpy.org/), [Pandas](http://pandas.pydata.org/), [Scipy](https://www.scipy.org/), [Jupyter](http://jupyter.org/), [Matplotlib](http://matplotlib.org/)

**2. Deep Learning:** [TensorFlow](https://www.tensorflow.org/), [Keras](http://keras.io/)

**3. Reinforcement Learning:**[Keras-RL](https://keras-rl.readthedocs.io/en/latest/), [stablebaselines](https://github.com/hill-a/stable-baselines), [TensorForce](https://github.com/reinforceio/tensorforce)

**4. Environments:**[AI Gym](https://github.com/openai/gym)

**5. Others:** [ipywidgets](https://ipywidgets.readthedocs.io/en/stable/index.html), [h5py](http://www.h5py.org/)


## How to use

### Build the image

to build the docker image after clone this repository run
```bash
$ cd docker-stablebaselines
$ docker build -t "name:tagname" .
```
 or pull from Docker Hub

```bash
$ docker pull posaune0423/docker-stablebaselines
```
### Start the container

```bash
$ docker run -p 8888:8888 -it "container_name:tag_name"
```

## Rendering on Jupyter notebook

The virtual frame buffer allows the video from the gym environments to be rendered on jupyter notebooks. 
Simple example with Breakout:
```python
import gym
from IPython import display
import matplotlib.pyplot as plt
%matplotlib inline

env = gym.make('Breakout-v0')
env.reset()
for _ in range(1000):
    plt.imshow(env.render(mode='rgb_array'))
    display.clear_output(wait=True)
    display.display(plt.gcf())
    env.step(env.action_space.sample())
```
