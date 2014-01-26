#!/usr/bin/env ruby
# coding: utf-8

Bundler.require(:default)

# For every file in /pdf dir do
Dir.foreach("/Users/Hasnain/Desktop/tmp/raw/pdf") do |filename|

# Ignore "." and ".." as they mean current dir and parent dir
next if filename == '.' or filename == '..'
filename = File.expand_path(File.dirname(__FILE__)) + "/pdf/#{filename}"
text = ""

# pdf is read and all the text is added to the text var
PDF::Reader.open(filename) do |reader|
  reader.pages.each do |page|
    text << page.text
  end
end

#tokenizer intialize
tokenizer = Punkt::LanguageVars.new

#Tokenize paper
paper    = tokenizer.word_tokenize(text)

#This section tokenizes the various sections of the OCR Biology Spec
comm = tokenizer.word_tokenize("(a) outline the need for communication systems within multicellular organisms, with reference to the need to respond to changes in the internal and external environment and to co- ordinate the activities of different organs;
(b) state that cells need to communicate with each other by a process called cell signalling;
(c) state that neuronal and hormonal systems are examples of cell signalling;
(d) define the terms negative feedback, positive feedback and homeostasis;
(e) explain the principles of homeostasis in terms of receptors, effectors and negative feedback;
(f) describe the physiological and behavioural responses that maintain a constant core body temperature in ectotherms and endotherms, with reference to peripheral temperature receptors, the hypothalamus and effectors in skin and muscles.")

nerv = tokenizer.word_tokenize("
outline the roles of sensory receptors in mammals in converting different forms of energy into nerve impulses;
describe, with the aid of diagrams, the structure and functions of sensory and motor neurones;
describeandexplainhowtheresting potential is established and maintained;
describe and explain how an action potential is generated;
describe and explain how an action potential is transmitted in a myelinated neurone, with reference to the roles of voltage-gated sodium ion and potassium ion channels;
interpret graphs of the voltage changes taking place during the generation and transmission of an action potential;
outline the significance of the frequency of impulse transmission;
compare and contrast the structure and function of myelinated and non-myelinated neurones;
describe, with the aid of diagrams, the structure of a cholinergic synapse;
outline the role of neurotransmitters in the transmission of action potentials;
outlinetherolesofsynapsesinthenervous system.")

horm = tokenizer.word_tokenize("(a) define the terms endocrine gland, exocrine
gland, hormone and target tissue;
(b) explain the meaning of the terms first messenger and second messenger, with reference to adrenaline and cyclic AMP (cAMP);
(c) describethefunctionsoftheadrenal glands;
(d) describe, with the aid of diagrams and photographs, the histology of the pancreas, and outline its role as an endocrine and exocrine gland;
(e) explain how blood glucose concentration is regulated, with reference to insulin, glucagon and the liver;
(f) outline how insulin secretion is controlled, with reference to potassium channels and calcium channels in beta cells;
(g) compare and contrast the causes of Type 1 (insulin-dependent) and Type 2 (non- insulin-dependent) diabetes mellitus;
(h) discuss the use of insulin produced by genetically modified bacteria, and the potential use of stem cells, to treat diabetes mellitus (HSW6a, 7b);
(i) outline the hormonal and nervous mechanisms involved in the control of heart rate in humans.")


excr = tokenizer.word_tokenize("define the term excretion;
explain the importance of removing metabolic wastes, including carbon dioxide and nitrogenous waste, from the body;
describe,withtheaidofdiagramsand photographs, the histology and gross structure of the liver;
describe the formation of urea in the liver, including an outline of the ornithine cycle;
describe the roles of the liver in detoxification;
describe, with the aid of diagrams and photographs, the histology and gross structure of the kidney;
describe, with the aid of diagrams and photographs, the detailed structure of a nephron and its associated blood vessels;
describe and explain the production of urine, with reference to the processes of ultrafiltration and selective reabsorption;
explain, using water potential terminology, the control of the water content of the blood, with reference to the roles of the kidney, osmoreceptors in the hypothalamus and the posterior pituitary gland;
outline the problems that arise from kidney failure and discuss the use of renal dialysis and transplants for the treatment of kidney failure (HSW6a, 6b, 7c);
describehowurinesamplescanbeusedto test for pregnancy and detect misuse of anabolic steroids (HSW6a, 6b).")

phot = tokenizer.word_tokenize("define the terms autotroph and heterotroph;
state that light energy is used during photosynthesis to produce complex organic molecules;
explainhowrespirationinplantsand animals depends upon the products of photosynthesis;
state that in plants photosynthesis is a two- stage process taking place in chloroplasts;
explain, with the aid of diagrams and electron micrographs, how the structure of chloroplasts enables them to carry out their functions;
define the term photosynthetic pigment; explain the importance of photosynthetic
pigments in photosynthesis;
state that the light-dependent stage takes place in thylakoid membranes and that the light-independent stage takes place in the stroma;
outline how light energy is converted to chemical energy (ATP and reduced NADP) in the light-dependent stage (reference should be made to cyclic and non-cyclic photophosphorylation, but no biochemical detail is required);
explain the role of water in the light- dependent stage;
© OCR 2013 GCE Biology v4
￼￼￼32
￼￼(k) outlinehowtheproductsofthelight- dependent stage are used in the light- independent stage (Calvin cycle) to produce triose phosphate (TP) (reference should be made to ribulose bisphosphate (RuBP), ribulose bisphosphate carboxylase (rubisco) and glycerate 3-phosphate (GP), but no other biochemical detail is required);
(l) explain the role of carbon dioxide in the light-independent stage (Calvin cycle);
(m) state that TP can be used to make carbohydrates, lipids and amino acids;
(n) state that most TP is recycled to RuBP;
(o) describe the effect on the rate of photosynthesis, and on levels of GP, RuBP and TP, of changing carbon dioxide concentration, light intensity and temperature;
(p) discuss limiting factors in photosynthesis with reference to carbon dioxide concentration, light intensity and temperature;
(q) describe how to investigate experimentally the factors that affect the rate of photosynthesis (HSW3).")

resp = tokenizer.word_tokenize("outline why plants, animals and microorganisms need to respire, with reference to active transport and metabolic reactions;
describe, with the aid of diagrams, the structure of ATP;
statethatATPprovidestheimmediate source of energy for biological processes;
explain the importance of coenzymes in respiration, with reference to NAD and coenzyme A;
state that glycolysis takes place in the cytoplasm;
outline the process of glycolysis beginning with the phosphorylation of glucose to hexose bisphosphate, splitting of hexose bisphosphate into two triose phosphate molecules and further oxidation to pyruvate, producing a small yield of ATP and reduced NAD;
state that, during aerobic respiration in animals, pyruvate is actively transported into mitochondria;
explain, with the aid of diagrams and electron micrographs, how the structure of mitochondria enables them to carry out their functions;
state that the link reaction takes place in the mitochondrial matrix;
outline the link reaction, with reference to decarboxylation of pyruvate to acetate and the reduction of NAD;
© OCR 2013 GCE Biology v4
￼￼￼34
￼￼(k) explainthatacetateiscombinedwith coenzyme A to be carried to the next stage;
(l) state that the Krebs cycle takes place in the mitochondrial matrix;
(m) outline the Krebs cycle, with reference to the formation of citrate from acetate and oxaloacetate and the reconversion of citrate to oxaloacetate (names of intermediate compounds are not required);
(n) explain that during the Krebs cycle, decarboxylation and dehydrogenation occur, NAD and FAD are reduced and substrate level phosphorylation occurs;
(o) outline the process of oxidative phosphorylation, with reference to the roles of electron carriers, oxygen and the mitochondrial cristae;
(p) outline the process of chemiosmosis, with reference to the electron transport chain, proton gradients and ATPsynthase (HSW7a);
(q) state that oxygen is the final electron acceptor in aerobic respiration;
(r) evaluate the experimental evidence for the theory of chemiosmosis (HSW1);
(s) explainwhythetheoreticalmaximumyield of ATP per molecule of glucose is rarely, if ever, achieved in aerobic respiration;
(t) explain why anaerobic respiration produces a much lower yield of ATP than aerobic respiration;
(u) compare and contrast anaerobic respiration in mammals and in yeast;
(v) definethetermrespiratorysubstrate;
(w) explain the difference in relative energy values of carbohydrate, lipid and protein respiratory substrates.")

# The intersection varible finds the words that are common to all the arrays hence are not indicative of which section the word belongs to
intersection = comm & nerv & horm & excr & phot &resp

# This section is finding the where the paper array intersects with the various arrays of tokenized spec points
# It then goes ahead and subtracts the intersection array
# The r in the var name stands for resultant
rcomm = paper & comm - intersection
rnerv = paper & nerv - intersection
rhorm = paper & horm - intersection
rexcr = paper & excr - intersection
rphot = paper & phot - intersection
rresp = paper & resp - intersection

#Puts the name of the file
puts File.basename(filename)

#Prints the results
puts "Communications: #{rcomm.length}"
puts "Nerves: #{rnerv.length}"
puts "Hormonal: #{rhorm.length}"
puts "Excretion: #{rexcr.length}"
puts "photosynthesis: #{rphot.length}"
puts "Respiration: #{rresp.length}"
puts "\n"
puts "\n"

end #Dir.foreach