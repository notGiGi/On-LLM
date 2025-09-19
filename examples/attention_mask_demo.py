import torch, torch.nn as nn
import matplotlib.pyplot as plt
pad_id = 0
batch = torch.tensor([
    [5, 6, 7, 8, pad_id, pad_id],
    [9,10,11, pad_id, pad_id, pad_id],
    [12,13,14,15,16,17]
])
B, L = batch.shape; D, H = 16, 2
causal_mask = torch.triu(torch.ones(L, L) * float("-inf"), diagonal=1)
padding_mask = (batch == pad_id)
attn = nn.MultiheadAttention(embed_dim=D, num_heads=H, batch_first=True)
x = torch.randn(B, L, D)
out, w = attn(x, x, x, attn_mask=causal_mask, key_padding_mask=padding_mask)
print("Output:", out.shape, "Weights:", w.shape)
plt.imshow(causal_mask.numpy(), cmap="gray"); plt.title("Causal Mask"); plt.colorbar(); plt.show()
