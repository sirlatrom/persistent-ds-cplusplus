select load_extension('/home/s062372/lib/libsqlitefunctions.so');
select
  operation,
  implementation,
  count,
  avg(duration/1e6) as 'avg dur (ms)',
  1.96*stdev(duration/1e6) as '1.96*stdev of avg dur (ms)',
  avg(duration/1e6/count) as 'avg dur (ms)',
  1.96*stdev(duration/1e6/count) as '1.96*stdev of avg dur (ms)',
  sum(count)/(sum(duration)/1e9) as 'ops_per_sec',
  count(*) as 'rows'
from results
where
  start_time >= 1353524545032260577
group by
  operation,
  implementation,
  count
;

