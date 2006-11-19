        # RT#40716: Some of these tests cause pathological harness
        # failures. skip them.  Put the skip here instead of in the test
        # file to keep all our hacks in one basket.

        # Other tests are parsable, and generally work, but require a
        # feature that hasn't been implemented, making passing them
        # impossible

array set skipped_tests {
  append-4.21          explode
  append-4.22          explode
  compExpr-old-14.14   explode
  expr-14.14           explode
  expr-old-2.38        explode
  expr-old-32.41       explode
  expr-old-32.42       explode
  expr-old-32.49       explode
  expr-old-34.9        explode
  expr-old-34.10       explode
  expr-old-36.3        explode
  expr-old-36.4        explode
  expr-old-36.8        explode
  format-3.1           explode
  format-3.2           explode
  format-8.17          explode
  format-8.18          explode
  string-13.6          explode
  string-13.8          explode
  string-14.11         explode
  string-18.7          explode
  string-18.9          explode
  string-20.4          explode
  string-20.5          explode
}
