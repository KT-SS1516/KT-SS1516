function dec = lempelzivdec(enc, dict, input)
dec = [];
for i = 1:length(enc)
    pos = dict(enc(i), 1);
    len = dict(enc(i), 2);
    dec = [dec, input(pos:pos + len - 1)];
end
end
