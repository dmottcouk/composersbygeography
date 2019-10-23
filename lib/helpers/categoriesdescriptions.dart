import 'package:flutter/material.dart';

class CategoriesDescriptions {
  static List<String> getCategoryDescription(String cat) {
    switch (cat.toLowerCase()) {
      case 'medieval':
        return const [
          '500 - 1400',
          'Medieval music consists of songs, instrumental pieces, and liturgical music from about 500 A.D. to 1400.',
          'Medieval music was both sacred and secular',
          'During the earlier medieval period, the liturgical genre, predominantly Gregorian chant, was monophonic',
          'Polyphonic genres began to develop during the high medieval era, becoming prevalent by the later thirteenth and early fourteenth century'
        ];
      case 'renaissance':
        return const [
          '1400 - 1600',
          'The Renaissance followed on from the Middle Ages and was for musicians an era of discovery, innovation and exploration.',
          'Most music written during this period is intended to be sung, either as large choral pieces in church or as songs or madrigals',
          'The most important music of the early Renaissance was composed for use by the church; notably polyphonic (made up of several simultaneous melodies) masses and motets in Latin for important churches and court chapels',
          'Even though most of the music of this time was non-secular (religious), there were examples of “music for fun”. They tended to be more livelier and more rhythmic than the church music. The madrigal was an example of this secular music'
        ];
      case 'baroque':
        return const [
          '1600 - 1750',
          'Some general characteristics of Baroque Music are:',
          'MELODY: A single melodic idea.',
          'TEXTURE: Balance of Homophonic (melody with chordal harmony) and polyphonic textures.',
          'TIMBRE: Orchestral - strings, winds and harpsichord with very little percussion.',
          'The music of the period reflects the decorative art in the use of ornamentation to embroider melodies.',
          'Thick and complex polyphonic texture prevails in many composers works',
          'A sense of drama and urgency is incorporated into in vocal forms such as the cantata, mass, opera, oratorio and passion, and in instrumental forms such as the concerto, concerto grosso, prelude, fugue, toccata sonata and suite',
          'Vibrant rhythms and expressive dissonances heighten tension in many Baroque works.',
          'Much of the Baroque keyboard music written for the harpsichord and clavichord was written in suites comprising separate dance pieces, changing in tempo and meter but maintaining key unity throughout'
        ];
      case 'classical':
        return const [
          '1750 - 1825',
          'A transitional era of about thirty years, termed “Rococo" between the Baroque and Classical periods set the stage for the emergence of the Classical style.',
          'The Rococo musical style was characterized by delicate, frivolous expression designed more to please than to excite the listener',
          'Some of the transitional composers are Couperin, Scarlatti and the sons of J.S. Bach',
          'Emerging from the Baroque period was a new style, highly refined, simple in melodic line and harmonic texture and unified by symmetrical form.',
          'Developing during the early Classical period were expanded instrumental forms such as the sonata, allegro and rondo forms',
          'The binary dance movements of the Baroque gave way to the ternary first movements of most Classical period works (sonata, concerto, chamber music, symphony) which comprised three parts: exposition (A) development (B) and recapitulation (A). ',
          'Frequently, well-defined melodies were harmonized with triadic harmony, especially in keyboard works with a broken-chord figure called the Alberti bass (named after Domenico Alberti who was one of the first to use this type of accompaniment)',
          'At the beginning of the Classical Period the musicians were still dependent on the church and wealthy employers. Gradually this began to change and by 1800 composers were writing mainly for the public.',
          'Major Classical period composers are Haydn, Mozart, and Beethoven'
        ];
      case 'romantic':
        return const [
          '1825 - 1900',
          'The impact of the French Revolution (1789-1794) set the stage for free thinkers and encouraged men of action to independent endeavours.',
          'Romantic music developed over the course of a hundred years',
          'During this time, many new forms emerged: the art song, (lied) which combined Romantic poetry with voice and piano; stylised piano music such as the waltz, mazurka, polonaise, and etude (study piece); piano music in free form such as the fantasy, arabesque, rhapsody, romanza, ballade and nocturne; and symphonic works such as the tone poem (descriptive piece)',
          'Programmatic content was expressed in tone poems by Liszt and others, and in symphonic works such as Berlioz’s Symphony Fantastique, and in piano music such as Mussorgsky’s Pictures at an Exhibition (later orchestrated by Ravel in 1923)',
          'The music of the Romantic period mostly contained warm, personal melodies; expressive indications (espressivo, dolce, con amore, con fuoco,) implied interpretive freedom (rubato) and harmonic colour (new chords such as the ninth) ',
          'Beethoven (1770-1827) bridged the Classical and Romantic periods in both his life and works reflecting the Classical influence in his early work and the Romantic in his later years',
          'Significant Composers of this time were Schubert, Berlioz, Mendelssohn, Chopin, Schumann, Liszt, Wagner, Verdi, Mussorgsky, Tchaikovsky, Dvorak, Grieg, Rimsky-Korsakov and Puccini.',
          'Some general characteristics of Romantic Music are:',
          'MELODY: Long, lyrical melodies with irregular phrases and extensive use of chromaticism.',
          'RHYTHM: : Frequent changes in both tempo and time signatures',
          'TEXTURE: Almost entirely homophonic.',
          'TIMBRE: A great variety of tone colour; woodwind and brass sections of the orchestra increased; many special orchestral effects introduced; rich and colourful orchestration'
        ];
      case 'contemporary':
        return const [
          '1900 - ',
          'The bridge to the Contemporary period was formed during the last quarter of the nineteenth century through a new painting movement called Impressionism.',
          'Composers like Debussy (1862-1918) and Ravel (1875-1937) portrayed musically these innovations in art and poetry being made by the likes of Mallarme and Verlaine',
          'Within this “modern” era, there are great style variations from Post-Romanticism (Mahler, Rachmaninoff) to Impressionism, to new concepts of melodic tonality-rhythm expressed in the music of Bartok, Stravinsky, Prokofiev, Copland, Shostakovich, Barber and Gorecki',
          'Polyphonic genres began to develop during the high medieval era, becoming prevalent by the later thirteenth and early fourteenth century',
          'Some general characteristics of Contemporary Music are:',
          'MELODY: Fewer lyrical melodies than the music of former periods',
          'RHYTHM: Complex rhythms',
          'TEXTURE: Percussiveness.Greater use of woodwind, brass and percussion instruments than in music of earlier periods.',
          'TIMBRE: The use of synthetic and electronic sounds'

        ];
    }
  }
}
