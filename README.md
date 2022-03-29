# NeRF_Notebooks
Colab Notebooks for using Instant-NGP with View Control

instantNGPDatasetGeneration: Pass video/images to generate the transforms JSON file

instantNGPTrainingAndRendering: Training the model and rendering with it using training and test transforms JSON files

RenderingControl: Camera movements - rotation and translation - for novel view generation

RandomlyPartitionTransforms: Generate random training and testing partitions of the transforms file in a chosen ratio

PartitionForExtrapolation: Separate out the frames on edge of the video for testing

MakeGIFs: auxillary utility to display results as gifs

Dockerfile: might be needed for setting up NeRF on non-colab environments
