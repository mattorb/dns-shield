# Primarily looking at how to spin this up in place on OS X using Docker . . . 


# OS X retrieve current DNS servers
scutil --dns | grep nameserver | awk '{print$3}' | perl -pe 'chomp if eof'

Pass those results in to run.sh, with :53

```
1.2.3.4
1.2.3.5
```

# Kick off CoreDNS as proxy 
./run.sh 1.2.3.4:53 1.2.3.5:53

# Update current DNS hosts
Change the current DNS to localhost:53 in Network pref's.  ugh.