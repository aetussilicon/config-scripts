const axios = require('axios');
const faker = require('faker');

// Lista para armazenar CPFs já gerados
// Função para gerar um CPF válido
function generateValidCpf() {
    const cpfNumbers = Array.from({ length: 9 }, () => Math.floor(Math.random() * 10)); // Gera os primeiros 9 dígitos do CPF
    const firstVerifier = calculateVerifierDigit(cpfNumbers); // Calcula o primeiro dígito verificador
    const secondVerifier = calculateVerifierDigit(cpfNumbers.concat(firstVerifier)); // Calcula o segundo dígito verificador
    return cpfNumbers.join('') + firstVerifier + secondVerifier; // Retorna o CPF completo
}

// Função para calcular o dígito verificador
function calculateVerifierDigit(cpfNumbers) {
    let sum = 0;
    for (let i = 0; i < cpfNumbers.length; i++) {
        sum += cpfNumbers[i] * (cpfNumbers.length + 1 - i);
    }
    let digit = 11 - (sum % 11);
    if (digit >= 10) {
        digit = 0;
    }
    return digit;
}

// Lista para armazenar CPFs já gerados
const generatedCpfList = new Set();

// Função para gerar um CPF válido que não se repita
function generateUniqueCpf() {
    let cpf;
    do {
        cpf = generateValidCpf();
    } while (generatedCpfList.has(cpf));
    generatedCpfList.add(cpf);
    return cpf;
}

const stateCities = {
    "AC": ["Rio Branco", "Cruzeiro do Sul", "Sena Madureira", "Tarauacá", "Feijó"],
    "AL": ["Maceió", "Arapiraca", "Rio Largo", "Palmeira dos Índios", "Marechal Deodoro"],
    "AP": ["Macapá", "Santana", "Mazagão", "Laranjal do Jari", "Oiapoque"],
    "AM": ["Manaus", "Parintins", "Itacoatiara", "Manacapuru", "Coari"],
    "BA": ["Salvador", "Feira de Santana", "Vitoria da Conquista", "Camaçari", "Itabuna"],
    "CE": ["Fortaleza", "Caucaia", "Juazeiro do Norte", "Maracanaú", "Sobral"],
    "DF": ["Brasília", "Ceilândia", "Taguatinga", "Recanto das Emas", "Gama"],
    "ES": ["Vitória", "Vila Velha", "Serra", "Cariacica", "Cachoeiro de Itapemirim"],
    "GO": ["Goiânia", "Aparecida de Goiânia", "Anápolis", "Rio Verde", "Luziânia"],
    "MA": ["São Luís", "Imperatriz", "São José de Ribamar", "Timon", "Caxias"],
    "MT": ["Cuiabá", "Várzea Grande", "Rondonópolis", "Sinop", "Cáceres"],
    "MS": ["Campo Grande", "Dourados", "Três Lagoas", "Corumbá", "Ponta Porã"],
    "MG": ["Belo Horizonte", "Uberlândia", "Contagem", "Juiz de Fora", "Betim"],
    "PA": ["Belém", "Ananindeua", "Santarém", "Marabá", "Castanhal"],
    "PB": ["João Pessoa", "Campina Grande", "Santa Rita", "Patos", "Bayeux"],
    "PR": ["Curitiba", "Londrina", "Maringá", "Ponta Grossa", "Cascavel"],
    "PE": ["Recife", "Jaboatão dos Guararapes", "Olinda", "Caruaru", "Petrolina"],
    "PI": ["Teresina", "Parnaíba", "Picos", "Floriano", "Campo Maior"],
    "RJ": ["Rio de Janeiro", "São Gonçalo", "Duque de Caxias", "Nova Iguaçu", "Niterói"],
    "RN": ["Natal", "Mossoró", "Parnamirim", "São Gonçalo do Amarante", "Ceará-Mirim"],
    "RS": ["Porto Alegre", "Caxias do Sul", "Pelotas", "Canoas", "Santa Maria"],
    "RO": ["Porto Velho", "Ji-Paraná", "Ariquemes", "Vilhena", "Cacoal"],
    "RR": ["Boa Vista", "Rorainópolis", "Alto Alegre", "Caracaraí", "Pacaraima"],
    "SC": ["Florianópolis", "Joinville", "Blumenau", "São José", "Criciúma"],
    "SP": ["São Paulo", "Guarulhos", "Campinas", "São Bernardo do Campo", "Santo André"],
    "SE": ["Aracaju", "Nossa Senhora do Socorro", "Lagarto", "Itabaiana", "Estância"],
    "TO": ["Palmas", "Araguaína", "Gurupi", "Porto Nacional", "Paraíso do Tocantins"]
};

// Função para selecionar uma cidade correlacionada ao estado
function selectCityByState(state) {
    const cities = stateCities[state];
    return faker.random.arrayElement(cities);
}


// Função para gerar um número de celular brasileiro sem formatação
function generateBrazilianPhoneNumber() {
    return '55' + Math.floor(Math.random() * 10000000000).toString().padStart(10, '0');
}

// Função para gerar um e-mail aleatório
function generateRandomEmail() {
    const emailProviders = ['gmail.com', 'yahoo.com', 'outlook.com', 'protonmail.com'];
    const prefixLength = Math.floor(Math.random() * 11) + 10; // Gera um prefixo aleatório de 10 a 20 caracteres
    const prefix = faker.random.alphaNumeric(prefixLength);
    return `${prefix}@${faker.random.arrayElement(emailProviders)}`;
}

function generateSkillsArray() {
    const skillsArray = [];
    for (let i = 0; i < 5; i++) {
        skillsArray.push(Math.floor(Math.random() * 34) + 1); // Gera números aleatórios entre 1 e 34
    }
    return skillsArray;
}


// Função para enviar solicitações POST com dados aleatórios
async function sendSignupRequest() {
    const url = 'https://listtta-backend.lryftz.easypanel.host/auth/signup'; 
    const userTag = faker.random.alphaNumeric(10); // Gera uma userTag aleatória
    const fullName = faker.name.findName();
    const email = generateRandomEmail();
    const password = "123";
    const taxNumber = generateUniqueCpf(); // Gera um CPF válido que não se repita
    const phoneNumber = generateBrazilianPhoneNumber();
    const whatsappContact = generateBrazilianPhoneNumber();
    const userGender = faker.random.arrayElement(['MASCULINO', 'FEMININO', 'OUTROS']);
    const role = 'PROFESSIONAL';
    const state = faker.random.arrayElement(Object.keys(stateCities));
    const professionalsDto = {
        type: 'TATTOO',
        instagramUrl: faker.internet.userName(),
        skills: generateSkillsArray()
    };
    const address = {
        state,
        city : selectCityByState(state)
    };

    const signUpPayload = {
        userTag,
        fullName,
        email,
        password,
        taxNumber,
        phoneNumber,
        whatsappContact,
        userGender,
        role,
        address,
        professionalsDto
    };

    try {
        const response = await axios.post(url, signUpPayload);
        console.log(response.status);
        console.log(response.data);
    } catch (error) {
        console.error(error);
    }
}

async function sendMultipleRequests(numRequests) {
    for (let i = 0; i < numRequests; i++) {
        await sendSignupRequest();
    }
}

const numRequests = 1000;

sendMultipleRequests(numRequests);
