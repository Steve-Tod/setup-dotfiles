python -c "import torch; print('Version: ', torch.__version__); print(torch.mm(torch.randn(3, 3).cuda(), torch.randn(3, 3).cuda()).shape)"
