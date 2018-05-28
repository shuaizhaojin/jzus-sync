import math

p1 = 181
p2 = 211

def avg_sync(s1, s2, offset=0, cdf=None):
    length = len(s1)
    total = 0
    worst = 0
    t = 0
    for i in range(length):
        #if s1[i] and s2[(i+offset) % length]:
        #if (s1[i] and (s2[(i+offset) % length] or s2[(i+offset+length-1) % length] or s2[(i+offset+1) % length])) or (s2[(i+offset) % length] and (s1[i] or s1[(i+1)%length] or s1[(i+length-1)%length])):
        if s1[i] and (s2[(i+offset) % length] or s2[(i+offset+length-1) % length] or s2[(i+offset+1) % length]):
            # sync in this timeslot            
            worst = max(worst, t)
            t = 0
        else:
            t += 1
            total += t
        if cdf:
            #f.write("%d %d %d %d\n" % (i, s1[i], s2[(i+offset) % length], t))
            cdf[t] = cdf[t] + 1
        #print(i, s1[i], s2[(i+offset)% length], t)

    worst = max(worst, t)
    return (total*1.0/length, worst)

def compute_all(seq, save=False):
    print("Computing", seq[1], "duty cycle:", "%0.3f"%seq[2])
    l = seq[0]
    ret = [0, 0]
    cdf = None
    f = None
    if save:
        f = open(seq[1] + ".cdf", 'w')
        cdf = [0]*(len(l)+1)

    for i in range(len(l)):
        a = avg_sync(l, l, i, cdf)
        ret[0] += a[0]
        ret[1] = max(ret[1], a[1])
        if i < 5:
            print(i, "%.1f"%a[0], "%d"%a[1])
    
    if f:
        count = 0
        for i in range(len(l)):
            count += cdf[i]
            f.write("%d %d %d\n"%(count, cdf[i], i))
        f.close()
    
    ret[0] /= len(l)
    print(seq[1], "Avg:", "%.2f"%ret[0], "Worst:", ret[1])
    print()
    return ret

def create_seq(f, size, name=""):
    l = []
    c = 0
    for i in range(size):
        if f(i):
            l.append(1)
            c += 1
        else:
            l.append(0)
    #print(name, "duty cycle:", c/size)
    return (l, name, c * 1.0/size)

def create_disco(p1, p2, name="disco"):
    return create_seq(lambda x: x % p1 == 0 or x % p2 == 0, p1 * p2, name)

def create_uconnect(p, name="u"):
    return create_seq(lambda x: x % p == 0 or x < -(-p//2), p*p, name)

def create_searchlight(p, name="sl"):
    return create_seq(lambda x: not x % p or x == (x // p * p) + (x // p + 1), p*(p//2), name)

def create_searchlight_plus(p, extra, name="sl+"):
    return create_seq(lambda x: x % p <= extra or x == (x // p * p) + (x // p + 1 + extra), p*(p//2), name)

def create_searchlight_minus(p, extra, name="sl-"):
    return create_seq(lambda x: x % p == 0 or (x % (2*p) <= extra) or x == (x // p * p) + (x // p + 1 + extra), p*(p//2), name)

def create_blinddate(p, name="bd"):
    return create_seq(lambda x: (x + 1) % p == 0 or x == (x // p * p) + (x // p) or x == (x // p * p) + (4 * (p / 5) - 1 - x // p), p * p / 5, name)

def create_searchlight_s(p, name="sl-s"):
    return create_seq(lambda x: not x % p or x == (x // p * p) + (x // p * 2 + 2), p*(p//4), name)

def create_blinddate_s(p, name="bd"):
    return create_seq(lambda x: not (x + 1) % p or x == (x // p * p) + (x * 2 // p) or x == (x // p * p) + (4 * (p // 5) - 1 - x // p * 2), p * p / 10, name)

def create_searchlight_s_plus(p, name="sl-s+"):
    return create_seq(lambda x: not x % p or x % p == 2 or x == (x // p * p) + (x // p * 2 + 2), p*int(math.ceil(math.floor(p/2)/2)), name)

def create_searchlight_s_minus(p, name="sl-s-"):
    return create_seq(lambda x: not x % p or (x % p == 2 and not x // p % 2) or x == (x // p * p) + (x // p * 2 + 2), p*int(math.ceil(math.floor(p/2)/2)), name)


## create disco sequence

#disco5 = create_disco(37, 43, "disco5")
#disco1 = create_disco(181, 211, "disco1")
#compute_all(disco5)
#compute_all(disco1)

#sl20 = create_searchlight_plus(15, 1, "sl20")

#avg_sync(sl20[0], sl20[0], 2)
#sl1 = create_searchlight(200, "sl1")
#compute_all(sl1, True)

#sl5 = create_searchlight(40, "sl5")
#compute_all(sl5, True)

#compute_all(create_searchlight(200, "sl5"))
#compute_all(create_searchlight_plus(40, 1, "sl7+1"))
#compute_all(create_searchlight_minus(40, 1, "sl7-1"))
#compute_all(create_searchlight_plus(60, 1, "sl5+1"))
#compute_all(create_searchlight_minus(50, 1, "sl5-1"))
#compute_all(create_searchlight_plus(300, 1, name="sl1+1"))

#compute_all(create_disco(181, 211, "disco1"), True)
#compute_all(create_disco(37, 43, "disco5"), True)

#compute_all(create_searchlight(200, "sl1"))
#compute_all(create_searchlight(40, "sl5"))

#compute_all(create_uconnect(151, "u1"), True)
#compute_all(create_uconnect(31, "u5"), True)

#compute_all(create_blinddate(300, "bd1"))
#compute_all(create_blinddate(60, "bd5"))

#compute_all(create_searchlight_s(200, "sl-s1"))
#compute_all(create_searchlight_s(40, "sl-s5"))

#compute_all(create_blinddate_s(300, "bd-s1"))
#compute_all(create_blinddate_s(60, "bd-s5"))

compute_all(create_searchlight_s_plus(60, "sl-s+"))
compute_all(create_searchlight_s_minus(50, "sl-s-"))




