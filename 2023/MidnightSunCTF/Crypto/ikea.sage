p = random_prime(2**1024)
q = random_prime(2**1024)
a = randint(0, 2**1024)
b = randint(0, 2**1024)

def read_flag(file='flag.txt'):
    with open(file, 'rb') as fin:
        flag = fin.read()
    return flag

def pad_flag(flag, bits=1024):
    pad = os.urandom(bits//8 - len(flag))
    return int.from_bytes(flag + pad, "big")

def generate_keys(p, q):
    n = p * q
    e = 0x10001
    return n, e

def encrypt_message(m, e, n):
    return pow(m, e, n)

flag = read_flag()
m = pad_flag(flag)

n, e = generate_keys(p, q)
assert m < n

c = encrypt_message(m, e, n)

print(c)
print(n)
print(p + b^2 * q)
print(a^2 * p + q)
"""
8572900207835762766259060305548427890100883047397634495461699978853157157614537323169347948562539226943681557963690343113654640872734234635812404134737383783029729221882136594985076147296741783975976308542646646810930077508306094278881958489094577466122474005274780847502484006774122175180575134906406965261990134809789771668692230279546111615898299677351494730026393299745116126441043262641839846131458109835024756668882646302817842268403187061058095410531259459671076936340425779509762997737719853997033122063887141701633633320429028875760558509090378244944304521100714575766987495025277855338621083017737516612418
11144809766924753211164169820974462795856999866851443978190116700121363041989551071283939406281584000345497130693285334786351068731714844065338178589052164965325272282738320690462179192218231489414187602007189279178640751309024526964298676986141201862905207755202946987885824563821850086298674083250354794989520315263319887676335677763156987501376451785566994901716198026893601133060745072362354091538721508265964958576574770694885291955086273571799403020416375990066994984333344295830201448319348356984141129557424755917133168216662244421360263592451413336939492881342257615928593787731918025125347411493314907250137
3133548371772245794593916200216569789009977503838749561227383433777720559941789482302916747603629163277628624218728934067099751860342707727093284736792795911695291350493714661780427322085098620600442730601203727048863482544984150704785568558089024822242137835533188983145916911039381864946181510766072421365244229323632933214703949194559838270346065808390788292338719229269524606818971098272185892178470535466837645119304408225231332458404102608745644737712878232270144653748091436259421085576899894410825994764509434190271250735054775427479336540747164022736063724088385024013450114201117597406901351692873529770371805217775170905068961082711810613758277323468498024046033975544974993657043847859384646871490664090364968788225608324873580922409806934637562732699242491794243842510137720412106011270126856983601691379316962610115528724097947971496018172633530779698135626404996346034214279586492856257103552654185991624401974
1668414440918184768102355070614199463515793278471647551081913918452877485930426726226888602387669498229921420169090265893271687426728329309931304042833872472475849661618647319286811295064264833639171767419811286840565958014252378459070198913214095511167368116072393143874905742547670514329775410132929858061858466466966832673233837546616958733459536386756690536101619509572857744943940172226354331174483476689882385303341939713713582201065151215959817799687574284712464653518663899972395427884233952547367314997783361776439415679136448860553029913121320416809081351610252174264463832509457873454643897905542501703122708259182482820112852708896076939481486564165447979041966168147292062612542988326875351534914932148857901377696892000822979439668349934754312002375192855438370671607139791178130484207096854031824894563191176002437196868004348552012031601430061559392941224723263095744921218764294325481602675909958988713011638
"""