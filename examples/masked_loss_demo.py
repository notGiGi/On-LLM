import torch, torch.nn as nn
pad_id = 0
targets = torch.tensor([
    [5, 6, 7, 8, pad_id, pad_id],
    [9, 10, 11, pad_id, pad_id, pad_id],
    [12, 13, 14, 15, 16, 17]
])
B, L = targets.shape
V = 50
logits = torch.randn(B, L, V)
loss = nn.CrossEntropyLoss(ignore_index=pad_id)(logits.view(-1, V), targets.view(-1))
print("Masked CE:", float(loss))
