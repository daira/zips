::

  ZIP: Unassigned
  Title: Remove the dependency of consensus on note encryption
  Owners: Daira-Emma Hopwood <daira-emma@electriccoin.co>
  Status: Draft
  Category: Consensus
  Created: 2024-10-22
  License: MIT
  Discussions-To: <https://github.com/zcash/zips/issues/917>
  Pull-Request: <https://github.com/zcash/zips/pull/918>


Terminology
===========

The key word "MUST" in this document is to be interpreted as described in BCP 14
[#BCP14]_ when, and only when, it appears in all capitals.

The term "network upgrade" in this document is to be interpreted as described in
ZIP 200. [#zip-0200]_

The terms "Testnet" and "Mainnet" are to be interpreted as described in section
3.12 of the Zcash Protocol Specification. [#protocol-networks]_

The character § is used when referring to sections of the Zcash Protocol Specification
[#protocol]_.


Abstract
========

ZIP 213 [#zip-0213]_ added the ability for coinbase outputs to be shielded. An
unfortunate side effect of this was to make consensus dependent on the details of
note encryption, because these outputs are required to be validly encrypted with
the zero key. This has unnecessarily complicated the specification and implementation
of consensus rules.

This proposal disentangles note encryption from consensus, by instead requiring
coinbase outputs for v6 and later transaction versions to be unencrypted. The
disentanglement will be complete once earlier transaction versions are no longer
allowed on the network, which is likely to happen in some later upgrade.


Motivation
==========

[...]


Requirements
============

The consensus rule change specified in this ZIP must, from transaction version 6
onward, make the implementation and specification of shielded coinbase outputs
independent of note encryption.


Specification
=============

TBD.


Deployment
==========

This ZIP is proposed to be deployed with the next transaction version change,
which is assumed to be v6.


Reference implementation
========================

TBD.


Acknowledgements
================

The author would like to thank Jack Grigg and Kris Nuttycombe for discussions leading
to the submission of this ZIP.


References
==========

.. [#BCP14] `Information on BCP 14 — "RFC 2119: Key words for use in RFCs to Indicate Requirement Levels" and "RFC 8174: Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words" <https://www.rfc-editor.org/info/bcp14>`_
.. [#protocol] `Zcash Protocol Specification, Version 2024.5.1 or later <protocol/protocol.pdf>`_
.. [#protocol-networks] `Zcash Protocol Specification, Version 2024.5.1 [NU6]. Section 3.12: Mainnet and Testnet <protocol/protocol.pdf#networks>`_
.. [#zip-0213] `ZIP 213: Shielded Coinbase <zip-0213.rst>`_
