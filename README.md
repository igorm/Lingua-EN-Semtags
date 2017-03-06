NAME

    Lingua::EN::Semtags::Engine - extract semantic tags (semtags) from
    English text

SYNOPSIS

      use Lingua::EN::Semtags::Engine;
      
      my $engine = Lingua::EN::Semtags::Engine->new;
      my @semtags = $engine->semtags("your blog post title");

DESCRIPTION

    Lingua::EN::Semtags::Engine uses Lingua::EN::Tagger and
    WordNet::QueryData to extract semantic tags (semtags) from English
    text. Semtags are words which reflect the semantic essence of a piece
    of text (similar to topic keywords).

    Lingua::EN::Semtags::Engine was designed and developed to solve a
    particular problem I was facing.

    Problem: a user is processing blog post titles and needs to
    programmatically determine the posts' semantic context.

    Solution: the user feeds a blog post title to
    Lingua::EN::Semtags::Engine and gets back a set of semtags which can be
    used for further processing (e.g., web searches).

    Example: a blog post title like "BBtv: Graffiti Research Lab, the
    movie" (boingboing.net, Xeni Jardin, April 24, 2008 8:00 AM) would
    produce the following semtags: DECORATION WORKPLACE SHOW.

    Please note that the module makes the following assumptions when
    attempting to extract semtags:

      * only nouns, verbs, adjectives and adverbs are considered as
      candidate words for semtags;

      * at the time of phrase detection, a frame is grown up to
      PHRASE_FRAME_SIZE (set to 3) tokens;

      * a language unit (a word or a phrase) is considered meaningful if
      its hypernym hierarchy in the WordNet database is at least MIN_ISAS
      (set to 3) levels deep;

      * a semtag is a meaningful language unit's hypernym at the
      SEMTAG_ISA_INDEX (set to 1, starts with 0) level of the hierarchy.

 METHODS

    semtags($string)

      Calls sentence($string), gets back a populated instance of
      Lingua::EN::Semtags::Sentence, iterates over its
      Lingua::EN::Semtags::LangUnits, populates and returns an array of
      their semtags.

    sentence($string)

      Returns an instance of Lingua::EN::Semtags::Sentence, populates it
      with Lingua::EN::Semtags::LangUnit objects which represent meaningful
      language units.

    tagger()

      Returns the Lingua::EN::Tagger instance used by the engine.

    verbose([$verbose])

      Returns/sets the verbose mode.

    wn()

      Returns the WordNet::QueryData instance used by the engine.

SEE ALSO

    Lingua::EN::Tagger, WordNet::QueryData

AUTHOR

    Igor Myroshnichenko <igorm@cpan.org>

    Copyright (c) 2008-2017, All Rights Reserved.

    This software is free software and may be redistributed and/or modified
    under the same terms as Perl itself.

