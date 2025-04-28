const fs = require("fs");

process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
	
const clientid = "sb-salesportal-hmm-qa-org-HMM_QA!t407305";
const clientsecret = "GfaNtUQWkjTVEJTMQV43B/VDkfk=";
const tokenUrl = "https://hmm-qa.authentication.us10.hana.ondemand.com/oauth/token";
const i18nUrl = "https://hmm-qa-org-hmm-qa-sales-portal-backend-srv.cfapps.us10-001.hana.ondemand.com/odata/v4/serverinit/i18nList";

const i18nAppPath = __dirname+"/app/main/webapp";
async function getToken(){
    let token;
    const options = {
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Basic " + Buffer.from(clientid + ":" + clientsecret).toString("base64")
        },
        body: "grant_type=client_credentials",
        method: "POST"
    }
    const res = await fetch(tokenUrl, options);

    if(res.ok){
        const resData = await res.json();
        token = await resData.access_token;
        return token;
    }else{
		console.log(res.status)
        console.log(res.statusText)
        throw new Error("[I18N Generate] get token error");
    }
}


async function getMessage(){
    let data;
	const token = await getToken();
    const options = {
        headers: {
            'Authorization': 'Bearer '+token
        },
        method: 'GET'
    }

    const res = await fetch(i18nUrl, options);

    if(res.ok){
        const resData = await res.json();
        return resData;
    }else{
        console.log(res.status)
        console.log(res.statusText)
        throw new Error("[I18N Generate] get message error");
    }
}

//언어별 i18n 정보 세팅
function jsonToProperties(json, prefix = '') {
	let properties = '';

	for (const key in json) {
		if (json.hasOwnProperty(key)) {
			const value = json[key];
			const fullKey = prefix ? `${prefix}.${key}` : key;

			if (typeof value === 'object' && value !== null && !Array.isArray(value)) {
				properties += jsonToProperties(value, fullKey);
			} else {
				properties += `${fullKey}=${value}\n`;
			}
		}
	}

	return properties;
}

//i18n 파일 생성
async function i18nMaking() {
	const message = await getMessage();
	const aI18nData = message.value;
	
	let i18n = {};
	if(aI18nData != null){
		for (const reqBody of aI18nData) {
			if (i18n[reqBody.language]) {
				i18n[reqBody.language][reqBody.langKey] = reqBody.text
			} else {
				i18n[reqBody.language] = {}
				i18n[reqBody.language][reqBody.langKey] = reqBody.text
			}
		}
		let aKeys = Object.keys(i18n);
		for (const element of aKeys) {
			let jsonObject = i18n[element];

			let properties = jsonToProperties(jsonObject);
			
			if(element === 'en'){
				fs.writeFileSync(i18nAppPath+'/i18n/i18n.properties', properties, 'utf8');
				console.log('Saved in '+i18nAppPath+'/i18n/i18n.properties');
			}

			fs.writeFileSync(i18nAppPath+'/i18n/i18n_' + element + '.properties', properties, 'utf8');
			console.log('Saved in '+i18nAppPath+'/i18n/i18n_' + element + '.properties');
		}
	}else{
		fs.writeFileSync(i18nAppPath+'/i18n/i18n.properties', properties, 'utf8');
		fs.writeFileSync(i18nAppPath+'/i18n/i18n_en.properties', properties, 'utf8');
		console.log('language data is empty!');
		console.log('Saved in '+i18nAppPath+'/i18n_en.properties');
	}
}

i18nMaking();

